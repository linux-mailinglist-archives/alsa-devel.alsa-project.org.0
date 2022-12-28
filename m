Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8981C65851A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 18:09:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED737542B;
	Wed, 28 Dec 2022 18:08:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED737542B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672247360;
	bh=nv/Xo6ZRkUFOtozlG5Xkg/tfEGxe95A4UcXx2Slm5/0=;
	h=Date:In-Reply-To:References:Subject:From:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BhOnJ1mnxImO28Lj33xig1rDOVS1ySANmWeNBy7PN4mU4pKXJETsvzmWOyEECPnYQ
	 t8pSMMFss2tR8VCFyGeYNKwDCZQHVCo3tPUf1W0eWfQQGL66V4xMOK2qUNDDwMJ+Xy
	 symeeAM96v1GlyDofGUABHoyZ6RCshuPex8wNAiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A1E0F80424;
	Wed, 28 Dec 2022 18:08:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62DB4F804CF; Wed, 28 Dec 2022 18:08:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2006FF80424
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 18:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2006FF80424
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=KE6i4nnt
Received: by mail-yb1-xb49.google.com with SMTP id
 i10-20020a25f20a000000b006ea4f43c0ddso17749315ybe.21
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nv/Xo6ZRkUFOtozlG5Xkg/tfEGxe95A4UcXx2Slm5/0=;
 b=KE6i4nntEVDYIBf6+HHkYg6TOMT5ly1RWBczBV7nIulT3pHW5sgUizDf8NuaS+6FOs
 Vpzi6cilk/lkHDm/A+uwtiN7RUZoDAirRffQSCqSIGlo7uR6dUeSn+MLbmQczsNu7R1c
 J/rK/8k8CDL5HoOMfEukyj+qIAbS90Z/obcF6n/hc/dN2P7QlFHp2Sciaa2kZ07cszx2
 a9MCtjDPfpoNs31TbtpkooRvTYnjuy4v3fU+VpkujiiuFgghnKn1ju51YtHphjeWNpPs
 fof78NB4KGJ4xOget8uTscihUFprmzBvCxZfBIIjFYQ/FXeOuTZ0Vfv3BS8aTpQrudH2
 xuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nv/Xo6ZRkUFOtozlG5Xkg/tfEGxe95A4UcXx2Slm5/0=;
 b=q7cj4xnHn5QTxS0RH0khNptk/lofsMHLB00f3mjc5bBN3sbS3wFcRxAEfmETNNqFwS
 OY9UYunuUR6VDg9x9KxqPR+AsFpip+rvbyxpoAWKUCmRxIUeDIxYV6alQ1p0/O2lsIUF
 Csj/vEl1VPONuFDtemyyIQijY1WmClauUDD1PmHgke5r25j4PD1Yz18yL0YXl4oT9WNp
 YySqg6POVhOE+r4Wq5HZa1EMkjVvCySm0k3GMzFfFuycRKNbWatc1cF03B+pUshDz3aB
 h+E8suLv2deZkSGRKD++zyCaFo5ZTurj3orWXJqcOsWlBaTTmMWJh6fIDMNrveUgdPo6
 0YMw==
X-Gm-Message-State: AFqh2krEm0ljJJ4jfIAYWzcRO+x03VaKm4P5uCTDKCUCIa0di+S7tR+J
 XyvuMhlZmrhknzc467eWVcfiXT+oyp/ZsxAdZkRjPj0ylg+jfiEyrOa+hz/oW2nRPsx8EzsahEP
 Zl8vMzLE1+HMDV/7guNTgawOQPNPGSHNqVJWT1iuSg+mjERs0emv3GkjVpM1V97v1+8HN
X-Google-Smtp-Source: AMrXdXtjuYtZsf1oG89XUvA2lDxhHw8HipO7qJgI3+hkPn3QuDHgpGONnLENyvbpHnr4/VlShCnIvq8mEIg=
X-Received: from adchan1.nyc.corp.google.com
 ([2620:0:1003:314:ac82:8888:fd06:669b])
 (user=adchan job=sendgmr) by 2002:a05:690c:831:b0:40c:9a15:591e with SMTP id
 by17-20020a05690c083100b0040c9a15591emr3055082ywb.117.1672247294311; Wed, 28
 Dec 2022 09:08:14 -0800 (PST)
Date: Wed, 28 Dec 2022 12:07:54 -0500
In-Reply-To: <20221110234915.2446931-1-adchan@google.com>
Mime-Version: 1.0
References: <20221110234915.2446931-1-adchan@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221228170754.2878481-1-adchan@google.com>
Subject: Re: [PATCH v1] ALSA: hda/hdmi: Add a HP device to force connect list
From: Adrian Chan <adchan@google.com>
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
Cc: tiwai@suse.de, Adrian Chan <adchan@google.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Sorry, I forgot to CC Takashi in my original email.
