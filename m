Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06A679F1F
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 17:45:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34DFC1ED;
	Tue, 24 Jan 2023 17:44:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34DFC1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674578737;
	bh=XMXNG98wU4htDggDkSsJGSj0yk+o5fnOoyh609u/lE4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zn78sXxwZstx5xfO+T/Kek6S/NtiFG1JS6nyM5m+Mm2vGExydGarAx08TDPyS14VD
	 JmA/sYoRBXBmEeyApx0hzWWOZLR8Yqv6udiSNzi9ehEr5SQ9GgRI2QdWBWLzMjKxoS
	 pAK53ISevvjt9p7bgVNd9EOqDabCTn4OjoPuqmSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6664DF800FB;
	Tue, 24 Jan 2023 17:44:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A58D6F8027D; Tue, 24 Jan 2023 17:44:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6FFCF801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 17:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6FFCF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mbuki-mvuki.org header.i=@mbuki-mvuki.org
 header.a=rsa-sha256 header.s=google header.b=fz85swFz
Received: by mail-yb1-xb2a.google.com with SMTP id p141so16830602ybg.12
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 08:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbuki-mvuki.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XMXNG98wU4htDggDkSsJGSj0yk+o5fnOoyh609u/lE4=;
 b=fz85swFzU0ss1AfQjWcKxeMogdi0W5nmAmHB7WwodY7UPv1tLI5xiES1H8MCdh8IEs
 CkKjTGYyGWljWa5dOc5/pY4tHJGSXQT58jUd6eutQohPSAnlTan7mCBlZdvZs+70KlSY
 fyQfUftaVHcemFs5zbYCwZiSHdUcotOa0wpyvnQ9X9wwINnisLMGJOfa98fvwx4RswMk
 mBj+wueCJOEMPxE3rBJrDiYvpC4AswkX1of2xColA5/KLB02miN9MaVM0+RV4aEWJlxB
 efrYKC7lKzI9UpV0evLazCLazri0Up2zxV8M3lzSAYzvUd3IArr5QE+IxhZLyXdPxDNy
 2Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XMXNG98wU4htDggDkSsJGSj0yk+o5fnOoyh609u/lE4=;
 b=GVhMth/5MMyFKhOTdYqOhEoe3+GTJlYLr9JPSXi92/SmcvAAWItG3r7vymXszDsYVp
 XqBgEjsFoXM/2EJior8CZ+CzQ767bs2LW1zoSUv++E0IM1HPNbOWbeYSs9ee8PO/s9dH
 acmoLf8OQ/By8872iBp6lVUenn2lAMqDjVNImRVgh8jdf8lIsaksS0P/HzjPvtYCI3Vz
 wqFoDClo2m7R62+d1pFBeiWO0iybpVEDOJ/Xi6jAt7sVCxh9OTBdLn/u6K8dQSeBBRDs
 1D7qKx8BNNqenVczsSj0nH949SmNthhmmpE6IWQG0vaNbsHlkncUo7vxHJfAuqDu7VN0
 AIMA==
X-Gm-Message-State: AFqh2kpRI8QfGrLdxjmryk2fVXv9bpK65u7GUDAG6n5c3fqMekYaaD9O
 R3NvjYOYhCyOgj+sRst5+bC9e1oT7Od5FWev22CngQ==
X-Google-Smtp-Source: AMrXdXumHJ/HmMjlOuoJ/Z1EKCDzDbWR5RBKerE3pke2AT4dHNhq+1o39m2kt8ynuHKw9CpI+3JVgSvl7qGw7M2hbDs=
X-Received: by 2002:a5b:592:0:b0:7ed:9cee:464 with SMTP id
 l18-20020a5b0592000000b007ed9cee0464mr3500184ybp.194.1674578672547; 
 Tue, 24 Jan 2023 08:44:32 -0800 (PST)
MIME-Version: 1.0
References: <CANSNSoUqROMDVAVb9ZFQbxRdBEAg7k86YHcyihp6hjoEokti6Q@mail.gmail.com>
 <47d687e3-50e4-967e-3c4a-846cfa4e3755@linux.intel.com>
In-Reply-To: <47d687e3-50e4-967e-3c4a-846cfa4e3755@linux.intel.com>
From: Jesse Hathaway <jesse@mbuki-mvuki.org>
Date: Tue, 24 Jan 2023 10:44:21 -0600
Message-ID: <CANSNSoWedQyTwSQHVrPz3u-YLs1yp94ioGepDiJOqEtOm3TVdg@mail.gmail.com>
Subject: Re: Intel sof-hda-dsp breaks suspend after using Pro Audio UCM
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 24, 2023 at 10:32 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> can you please file an issue here:
> https://github.com/thesofproject/linux/issues

done, https://github.com/thesofproject/linux/issues/4151, thanks!
