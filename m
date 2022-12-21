Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBDF653844
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 22:40:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B33D4E;
	Wed, 21 Dec 2022 22:39:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B33D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671658809;
	bh=wPkSZK1YNKDDYmVlu8eBpUVJO7V5pmzoccqTw9DSewY=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IbPOKwtdsLboU98S52aGOuTKmr5N6s7FPu/va0dMcF1t7gnrJR/Jf50PI6ytTMRMQ
	 AxnOXfv5eMHSEWfYtxQqkkaa37b7sRXPtH8l4k4TYbxG4XBGEBaYq14VXRmnxHUvwU
	 5j1xKRukOSWworFtG6nQjh+OJ08azZbNfO4dWJyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDE7BF801C1;
	Wed, 21 Dec 2022 22:39:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6911F8047B; Wed, 21 Dec 2022 22:39:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B25F801C1
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 22:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B25F801C1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Jl3IS7zO
Received: by mail-ej1-x62e.google.com with SMTP id bj12so555812ejb.13
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 13:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wPkSZK1YNKDDYmVlu8eBpUVJO7V5pmzoccqTw9DSewY=;
 b=Jl3IS7zOOrpiak6Bs0OkiFRED5VyMDTr196cha36KNwMKM+38WsSSMSMz4ppOdAaho
 S0ObJom6v3eAcG0RFz9ikvXgPwhLXcFObCCEOa+AiW/91vrlhkXzWYN7s7lKEggYgu8y
 sVra6odcgLD1235UJKmNdykMGDz0j0zoOHM+3RGT+6dXZhYcEZlVb5yegMRh9DmI3dCh
 VYFOVNOPs8NN0TmK2oMD3E9MvfNyTOJGHykMJ0cw2q8VZg8YMtputpaSv4eRQqE1AEo3
 s1AAK2UKJDfXy5SG9O9dZIYb7PSHHZnpu/9MDFPfVlYr3R/6Wv52weY7ToJ+zeLO27T1
 vdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wPkSZK1YNKDDYmVlu8eBpUVJO7V5pmzoccqTw9DSewY=;
 b=0okpDxQ4nXOqwB0YJrH2ri23F0uKrXji+1ZPG2KfxM1/qb8a5gJSw92vNcE2RPeCVl
 NKzLlzCABUGV0XyRwq71WCIuoI+QTLumy7cifIwzJ/0/q08FER3VgM5eWo+ej4hnDbtm
 boDAXnPnIfn/SEsoEuAQghCxd3WhohPVZZTsjQ9H0ZW7TuGAY7Eed2OkAA5ZoYclR4In
 NfVtDZdz4ObGfImdjlEIzWEwL6GWQlyY0GD162HMvlSGTtGZoriPbBXF8/VPnCXuxbP2
 vs/+Y+8BW8wKkPze0Mtg01UEFxz9dpGfFNegX5K19ujKUNYdZKLyx/zWvDBMzuZRKDoV
 V0PQ==
X-Gm-Message-State: AFqh2krD1OBK2vbv1baZracZSnIsxNmcPg8dBPPve61WfCFHxoivUjKF
 jxfL6hg5kAgrleh15l+aTR7vUCwy5UIEuKVBscFnaq4UMppWbw==
X-Google-Smtp-Source: AMrXdXubxhgyNBIWQDfJKBEE3SadSdBOZfD6p/VocWFMJITGGngFV0oDhaWpeMuzAEtCPnbozaGOXrrBKMMfMlxNZ00=
X-Received: by 2002:a17:906:c299:b0:7ba:708f:2a03 with SMTP id
 r25-20020a170906c29900b007ba708f2a03mr239562ejz.167.1671658745607; Wed, 21
 Dec 2022 13:39:05 -0800 (PST)
MIME-Version: 1.0
From: CoolStar <coolstarorganization@gmail.com>
Date: Wed, 21 Dec 2022 13:38:53 -0800
Message-ID: <CACGbgQXL737KoLRewpZ94V_PjRAG4MLvFF76rTxaMMEAZEDNzQ@mail.gmail.com>
Subject: Re: Re: [PATCH] ASoC: Intel: avs: Add support for RT5663 codec
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a question that Cezary would need to answer, as setting the
format was simply brought over from the da7219 AVS machine driver.
