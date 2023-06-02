Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C87227EA
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:54:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4C5827;
	Mon,  5 Jun 2023 15:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4C5827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973286;
	bh=XqJYExxQFEBS1earnpLrL3D6RMEK1qeUhABHq/1MA6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AEgI0Kg0uPBIyxnVQCBhhh1weAtYLaOQJioP5IsAAMNVllWoxNmQP6oQFJZYhS0c5
	 kBmswqQtgcfw5cG/735+n6NKlAF/ijVJlepO3Z8ApPRq4W5rkSvvEBTi5AnjRM2266
	 a+nZBb/nCevGJcdqZlxlqu8T/WD/FHNiDWHfuTyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B5A5F8057E; Mon,  5 Jun 2023 15:52:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91D63F8057A;
	Mon,  5 Jun 2023 15:52:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C2B8F800ED; Fri,  2 Jun 2023 11:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40DF4F80149
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 11:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40DF4F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=pqrs.dk header.i=@pqrs.dk header.a=rsa-sha256
 header.s=google header.b=K1yBeMpB
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51640b9ed95so241258a12.2
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Jun 2023 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1685696626; x=1688288626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/iuC9pgq+loj7BUT0q2UIND8pBHqchhclkWSDPXeDM=;
        b=K1yBeMpBVIyXpZOk4aIP0ge7LNiFJvDqYOSNIVpD86eYCYyy8DH0RfBt7XJAG4NSRk
         5RKTKtJKP/1Oa0yeujEtwik60eVCbWz6w175oko0mwaI+fY0LUHU39kh/wpADcdnjOwa
         NqDT95GmEvI13yF+WnHDrTE8xsAFdkWt40HxiB4+Wrue8DmFxzQVSAyPbWghNCMdspfk
         NlNHWIdVoWhLNGrnrxxrPvE7w/CXasgvunm/4116b9qSZ173Cjp7zZHfUfsdbp297AcE
         FGMwB5xdCy7hUFh7R0RsYEtEsEfHpOl5YNbJKDaWOfWsnIkZs+k6n19ff7HNoKfTrw3F
         /xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696626; x=1688288626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/iuC9pgq+loj7BUT0q2UIND8pBHqchhclkWSDPXeDM=;
        b=NsD7ZY+QZ3tKxrgpRjEFVzd27lIBWYUzrZ2dm7Bv1raGf68DC1v64r5pegqrC5KfXr
         4XV73Mq9Ob9PRgaO9y4ra7bhLmToU4BI6h0niyyO0U46NhfyJeTNDAFRlAaM6os+4itR
         JSI4QAxMZATZnRlcGN9oePYIr3eJzQZLiWJ4lpm/1lOTUkQDGfoW37JhSMZEyLzeHIzo
         ARFc5AEtZHK/HcljyRlULwoXyK0Tj1XQTMUHYs1i/qVuUTPDP10/J/ZRq7a8+L6OkfmQ
         lCXuMFWmYvKzwW/8LJ4NwvBS+OU8aZ1mz6K22iWazJMFlFc+d9u9TvrgWC3OfG8Jfpiw
         z4XQ==
X-Gm-Message-State: AC+VfDzsYsl84yiXanhKgUiQxehsOsMv4SQKvtDYENXmfYzAwZXALG21
	Ab02m3Qtozo8CADY3cmagzFfmw==
X-Google-Smtp-Source: 
 ACHHUZ57MiVriTCuxX+gZLPjT5VoffIDc1r1ZvgGusNN8s74xGZXqvkznPNQ/GUhKpf/VK5I52mxjQ==
X-Received: by 2002:a17:907:3e14:b0:974:545d:cfa3 with SMTP id
 hp20-20020a1709073e1400b00974545dcfa3mr2630054ejc.64.1685696626324;
        Fri, 02 Jun 2023 02:03:46 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id
 w23-20020a170906385700b009707fa1c316sm488031ejc.213.2023.06.02.02.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:03:46 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: core: add support for dai-links with symmetric
 clock roles
Date: Fri,  2 Jun 2023 11:03:19 +0200
Message-Id: <20230602090322.1876359-3-alvin@pqrs.dk>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230602090322.1876359-1-alvin@pqrs.dk>
References: <20230602090322.1876359-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: alvin@pqrs.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LXRNK2RMXGEIDDKDT3FD6MXQWK6NJMM4
X-Message-ID-Hash: LXRNK2RMXGEIDDKDT3FD6MXQWK6NJMM4
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:52:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXRNK2RMXGEIDDKDT3FD6MXQWK6NJMM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The snd_soc_dai_link::dai_fmt field contains the nominal bit- and
frame-clock consumer/provider role from the point of view of the codec.
The ASoC core then assumes that it should flip the roles when
initializing the format on the CPU. But in cases where both the CPU and
codec are clock consumers, e.g. because of an external clock source,
this assumption breaks down.

To allow for proper configuration of the backing CPU/codec drivers for
consumer roles, introduce support for a symmetric_clock_roles flag. The
role flipping will be skipped when this flag is set.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 include/sound/soc.h  | 3 +++
 sound/soc/soc-core.c | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 533e553a343f..87f4fb3d4b20 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -718,6 +718,9 @@ struct snd_soc_dai_link {
 	/* Keep DAI active over suspend */
 	unsigned int ignore_suspend:1;
 
+	/* Assume CPU/Codec have the same clock consumer/provider role */
+	unsigned int symmetric_clock_roles:1;
+
 	/* Symmetry requirements */
 	unsigned int symmetric_rate:1;
 	unsigned int symmetric_channels:1;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b48efc3a08d2..7817b86dd93d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1216,6 +1216,7 @@ static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
 int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 				unsigned int dai_fmt)
 {
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	unsigned int i;
@@ -1231,7 +1232,8 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	/* Flip the polarity for the "CPU" end of link */
-	dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
+	if (!dai_link->symmetric_clock_roles)
+		dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
-- 
2.40.0

