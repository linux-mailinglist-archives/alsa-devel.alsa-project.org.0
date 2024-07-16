Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD5C933A0F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43471846;
	Wed, 17 Jul 2024 11:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43471846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721209035;
	bh=bAR4TO3azR2Aj5pwMTuSvQeFegcAjm6GvDZQNPam9QA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pNiK8ZO69je6aFkjzWw4HD3te0QVlf3DLpeHuP5O82lccscBP/9kzgb/hoTOLN2Vt
	 2Pkwk0u/oM0U5zUfYR6IP1DrX8JiLhj5Vz+RIGxi6T1l88TiUfLFGc5Azv40HGEFNR
	 rUfgyCSYy2Z+zfeDsCf0RjByF3IEOM4fD3ybvm8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BE12F80654; Wed, 17 Jul 2024 11:35:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8945AF8065B;
	Wed, 17 Jul 2024 11:35:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62FFBF8026D; Tue, 16 Jul 2024 08:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C9CAF800C1
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 08:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C9CAF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gXj0bFJr
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4266b1f1b21so34308295e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 15 Jul 2024 23:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721110172; x=1721714972;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/5RvrY6Lj40ei0FypxPhi5GZJ9Hyabwj6zIILE6XtQ=;
        b=gXj0bFJrA+0hZr//OBXdD+93rlhlBCXixgW7xo9dnnpGIqu1LLrzbR61YLsF5Ywlwv
         OExJPEjpdeL6WDLIbIBkxs/SuWv79UpyZrq826iKaQlHdqpnODWH2PCfjh2PtnkCHmaD
         574xtJX7/3fLGctjVyypjSq1PBO5OYrBWT5BhWSaZGk7bTPURfkD0ULj5LE34QrjPf6M
         PH8iG+zc5lY+CKAWCtoB9IcA0lvG3rF4xyp1uxmZw5xLwR7Vde4E8HuaLnwN5rPkYkHl
         YMNVSTvoklWyFrWEdoheLU2ckymSfEtlFZINpx2uuPQQ/ybYsCiWlmvCHfqVyOP2gMqW
         vm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721110172; x=1721714972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/5RvrY6Lj40ei0FypxPhi5GZJ9Hyabwj6zIILE6XtQ=;
        b=Fn4uJxOR9IrhHvHpjOHz8dDyObr4UIcHOr8n9AuknRCKNN/kwcjwaxZ+yyILRr8g4D
         hDndaEJjUdwLpxm+vGTtF+/OSXk66bpMvOL13TAjhLGlfWUaX8pM0KHcSfDRfe2Gx/Xj
         iEHvrbvoG2pNx64xOJ0taGJ2OC0rfAIFfTEDdsR5BhQk3BC637K9NSH/yYuhGQDqL7yJ
         cfO1bjX0tKqDzI2OaTDOxwn5GqnVI/H9qzqO+80qY9WxTW1KKv1A2cEPdb9kHzSczZZG
         JXMCztP2PGXsSGVGLkTl/3610ALsgjxRmtFigp3DWQuIPml2U6SY2ZaHm/jAEp7A3gj7
         Cn1Q==
X-Gm-Message-State: AOJu0YxiyP0uGwBJ5J8R0mtZ3iE7MXbt0vMBbj7bQyvYaFc2tGeP/1uD
	cUzJ1ndJ90iz7p9M6EclS15uyOjEZzyhnxi6cU95Sy5XrQEJsfXC3IHPolMuLgpkMOoBV3uRaFT
	0eS53eyA+wTtd+MenYKjxVKGM+gjY/PY=
X-Google-Smtp-Source: 
 AGHT+IHjjTzCLwXIr7VONX7bxU4RAdaKvoc6NddJBNgasPNwPDcJqRYqwQdEv/3ea40im9XomrMZoQv1w5XQ9JyOmjs=
X-Received: by 2002:a05:600c:1383:b0:426:6455:f124 with SMTP id
 5b1f17b1804b1-427ba4b6547mr7121205e9.0.1721110172329; Mon, 15 Jul 2024
 23:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.0.1673946668.16556.alsa-user@lists.sourceforge.net>
 <0c99f6e0-c2f8-bc30-be10-314708382345@sc-riebe.de>
 <c21f506a-255e-5885-7dde-f9716187536e@sc-riebe.de>
In-Reply-To: <c21f506a-255e-5885-7dde-f9716187536e@sc-riebe.de>
From: Xinhui Zhou <zxinhui2001@gmail.com>
Date: Mon, 15 Jul 2024 23:09:21 -0700
Message-ID: 
 <CABsjGHLPYa26noDK3LDR_9EDxjXRZ9E5cEDAAyYnCEiuCPYWTg@mail.gmail.com>
Subject: Help on specifying 'chmap' in asound.conf
To: alsa-devel@alsa-project.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-user@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: zxinhui2001@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IJUIJSDZHWPHW7GSAQG6UNHYN5HBFGIV
X-Message-ID-Hash: IJUIJSDZHWPHW7GSAQG6UNHYN5HBFGIV
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:35:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJUIJSDZHWPHW7GSAQG6UNHYN5HBFGIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dear all,

   I am having a question regarding how to specify 'champ' for a
plugin.  I do not see any examples of this. I tried many ways to
specify but failed.

  As indicated by the link below,   I can specify the MAP as a string
array.   Can someone provide one example on how exactly this    [chmap
MAP]  can be specified?

"
pcm.name {
        type cras
    [chmap MAP]     # Provide channel maps; MAP is a string array
}
"
https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_plugins.html


I can something like these, but none of these work for me.

chmap LFE
chmap "LFE"
chmap FR,FL,LFE
champ "FR,FL,LFE"

Thanks!

Xinhui,
