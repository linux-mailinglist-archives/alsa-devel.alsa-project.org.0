Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F108ACE96
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 15:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 750A7DF6;
	Mon, 22 Apr 2024 15:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 750A7DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713793503;
	bh=eLwGpBWNSzsKehoMyzaBaeqO5Km6GsohfpkHMeO3sMI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cubbIlehgwp+n/dwEnkLR0SZ+rTSqoYlnjhze75rjLNAh8cxARKTGM9wjJ8qCw9Vk
	 m/UDDSUrg0ZDz70i1bJtguvi42klRkQCdZ5sxf+cEgFBwkdjevITGFoDhF1pHQ1uIL
	 jWhBslhDddFezJ4u+UieHA3/Jdh943Z8GYOQfbiE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36B66F805F4; Mon, 22 Apr 2024 15:44:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38A19F805F1;
	Mon, 22 Apr 2024 15:44:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F24FFF802E8; Mon, 22 Apr 2024 15:44:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4323F800B5
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 15:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4323F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pXsXFAAI
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41a4f291f80so8084685e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713793439; x=1714398239;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IyhHpXfSBoKLASPLnhxuYO1fMBmMIpkOZFN42OM7jY4=;
        b=pXsXFAAIBO6siwoStWv6kF1IhcY394WpZoQyh5pEVIzRXp8QmjFEh1RFGTElLASJQ0
         uTXrwM0IVLErVRKIoFHwOCoU1PDhZeXubJNz37IFIzYZdGdmPYLtSVANYI/MKJW+WNvo
         AL87kD39NQGM7zetgSbvt+DcD1OqbnSWGzR4wHTE6Zj1pS24T2J0Ll1DuAas4Je8daxa
         UufogQ3Z460+CPmZrUNElBWAiGdhtoReSs+NJXgCaFHMqRX8fKCBn5Ghy1ypcXdl7yXT
         qZeeKGrz9YRKBR458TTE3Wz85vNjZkD/QvLo/Sn57a98Y3PMABFG8WOt+TqerhG8pW3D
         ulNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793439; x=1714398239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyhHpXfSBoKLASPLnhxuYO1fMBmMIpkOZFN42OM7jY4=;
        b=fc98B/8Sqf1GjQcjotykkww9fHxB5kId06mSuvsQABD48EdcdYuI9fWrgFmCkcDcGj
         VbT88cQAMiNR7ed7/1nN4PvaSEDlURLANzNVRltBxSN9/qhH/XH64k39IDwBsyGioHVh
         5F4qJIgU9OVh9h3T0Ll3uU8Ufh2+zk5GV9iCS6PT4+8qkd9kq9bl03Ray37KUycC+xHP
         jkYbLY8fQL+Re0LrVCMYO0C7353uwzQW7IB/5PmnPke0n3QSTETfBuUbco1Y35dSs/II
         qm0D71oCmsrS4dYGBZPDXlwWRr/cr8JzryKs79mbiREBjfk7nnhYKezZNsl2bKE4oxpk
         OXjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXysGrpT7ubvUXbcmkd6S6v8jaIiQrzhOtJVYoKbbVh427q9irZGf14m4J1qGTgN/7zseDI5nw8QmBKaLDMQi7L1tB3RlWBrvt8CJ0=
X-Gm-Message-State: AOJu0YziuRYMU6K7itzEgCEXOnVVBzU6ZpH4eGZyu2yQdCyHKTGqDwb/
	iJPMrmdgbJxx9f2UKdsBSwq8A7LBAhhrJarsaPAcMgYXip4yKZPyFfez5E4D634=
X-Google-Smtp-Source: 
 AGHT+IGVKGiL+8Ldo4qtKC5/WdzouQLf24IRdTEX/wcJBZuyxLhla2b8gT7u4AqyanBsHU3HdncymA==
X-Received: by 2002:a5d:69c1:0:b0:343:ef1b:9f69 with SMTP id
 s1-20020a5d69c1000000b00343ef1b9f69mr8121800wrw.43.1713793439531;
        Mon, 22 Apr 2024 06:43:59 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b00417d624cffbsm20731069wmq.6.2024.04.22.06.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:43:59 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/4] ASoC: qcom: display port changes
Date: Mon, 22 Apr 2024 14:43:50 +0100
Message-Id: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6VBDMB4R7WNG3M6HYRYS33Y7BR2ZE6LD
X-Message-ID-Hash: 6VBDMB4R7WNG3M6HYRYS33Y7BR2ZE6LD
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VBDMB4R7WNG3M6HYRYS33Y7BR2ZE6LD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patchset adds support for.
	1. parse Display Port module tokens from ASoC topology
	2. add support to DP/HDMI Jack events.
	3. fixes a typo in function name in sm8250

Verified these patches on X13s along with changes to tplg in 
https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp

Thanks,
Srini

Changes since v1:
	- Fixed unused variable warning.
	- fixed warning 'break;' to avoid fall-through

Srinivas Kandagatla (4):
  ASoC: qcom: q6dsp: parse Display port tokens
  ASoC: qcom: common: add Display port Jack function
  ASoC: qcom: sc8280xp: add Display port Jack
  ASoC: qcom: sm8250: fix a typo in function name

 sound/soc/qcom/common.c         | 29 +++++++++++++++++++++++++++++
 sound/soc/qcom/common.h         |  3 +++
 sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++++
 sound/soc/qcom/sc8280xp.c       | 14 ++++++++++++++
 sound/soc/qcom/sm8250.c         |  4 ++--
 5 files changed, 74 insertions(+), 2 deletions(-)

-- 
2.25.1

