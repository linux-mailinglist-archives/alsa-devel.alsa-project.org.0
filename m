Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90AA61585
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Mar 2025 16:58:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E66560418;
	Fri, 14 Mar 2025 16:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E66560418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741967875;
	bh=ZZGNMIv+7ubq3C08ymB563OSRghoTPXhIKrm0DJAr0A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lE/vlvi70iHQmavEh3Sj2GEHNd5z6MHP2q8h3V+yYuBPT25JvhfFheDtdW8kK9ewH
	 esrAhCvn/leZ3N4hDH/0wSXsavh4bhYrM7OVtIl3opGnZW2BOQXKq1M6Bs3sE/RePh
	 P06WW5XKeO1oNPI4ZrckmOpEe5G9ZI5onvAXuUMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F378F8064C; Fri, 14 Mar 2025 16:56:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C00CF8065A;
	Fri, 14 Mar 2025 16:56:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66B30F897DF; Sun,  9 Mar 2025 10:52:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-91.sina.com.cn (smtp134-91.sina.com.cn
 [180.149.134.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FF0CF80659
	for <alsa-devel@alsa-project.org>; Sun,  9 Mar 2025 10:52:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FF0CF80659
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.31) with ESMTP
	id 67CD64DB00000524; Sun, 9 Mar 2025 17:52:29 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: B1BE9EF4BC834BA2845525DC5EFD9A9D
X-SMAIL-UIID: B1BE9EF4BC834BA2845525DC5EFD9A9D-20250309-175229
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzysztof.kozlowski+dt@linaro.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Subject: RE: [PATCH v5 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Date: Sun,  9 Mar 2025 17:52:27 +0800
Message-Id: <20250309095227.113183-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6ZQXRJPDJFZFZHBW4WPADI7HMMM7422B
X-Message-ID-Hash: 6ZQXRJPDJFZFZHBW4WPADI7HMMM7422B
X-Mailman-Approved-At: Fri, 14 Mar 2025 15:56:22 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZQXRJPDJFZFZHBW4WPADI7HMMM7422B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> >  1 file changed, 50 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> 
> 
> You got feedback how to create CC list. Two times.
> 
> You still create it incorrectly and Cc address which does not exist in
> the kernel and is a proof you work on wrong tree, which I asked to correct.
> 
> What's more, there is still no changelog and you never responded to
> review comments.
> 
> Can you slow down with resubmits and rethink the received feedback? I
> expect that feedback to be responded to, so I am not wasting time here
> repeating the same every time.

I'm sorry for the trouble I've caused you.
And I have responded to the comments at v3 and v4.
