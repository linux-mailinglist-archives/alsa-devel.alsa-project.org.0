Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB7F75267A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 17:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF8D820;
	Thu, 13 Jul 2023 17:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF8D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689261390;
	bh=TFAY4L5XJUx9/vo7ggB/EBuTFQ9Qb4wSV72L00B3uLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q6yQEcT+e0oku8VmwrKt93zyzY6aJI09vKeqBDCRG9pTaRMyQcYIvybGYxGxVsj/v
	 7TXGRv64lqs1pvC7yxNpDzqLq6Wu+tSDKmtU3Z7JJhWyktZfded5F0YNEBu3343+3B
	 pto6z00x9KRKWn6NRuYZILBbMbyY2uEcFszAaB1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87F2BF80557; Thu, 13 Jul 2023 17:15:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA810F8055B;
	Thu, 13 Jul 2023 17:15:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99E03F80570; Thu, 13 Jul 2023 17:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94277F8055B
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 17:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94277F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=kwu1l+2N
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9924ac01f98so123245066b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689261301; x=1691853301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejWIQTJ8MrmjvLsNIW9S8vt55JHQjtyx46a8r32tq1g=;
        b=kwu1l+2NxOFNYyFrFJ50wUPA5KuDc9reRIUJeO6GfB4hdFhvchS3utDFJnFdb9Dm3N
         vlGKRDF1rgoIx9ZS9Fsc3DUV148QyeWpu/xdxUU5Xk9cGMMLcimPdlfeO1NHKIxKkBCW
         e/Z9K5Th34uLR+N0YOi1JenYNinzkGOpDt+AqrA2GzAYYPnDtjCqlkXY7u4ZBAT1qQTk
         qsMrPxfxVJJEjNUOcZFdftxBaHdHOBmv/MhmtLUJpX3r5++XKrbM/6BmFH5Hbgr19jRZ
         TwE68jDuDk0SS+I5/HU/pjSVF0AMNMbKDxXoTbReRDa+iZ8FX5c2SNp44O/GhWboC5MF
         gZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689261301; x=1691853301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejWIQTJ8MrmjvLsNIW9S8vt55JHQjtyx46a8r32tq1g=;
        b=Kj/yAf/KCnhKa5V8W99MXBIHoLXpMIaJdfYCSmyyZv4MaOOk7UmnS+xZXs9hazx1NN
         pElW1eM46iWji9oAYasv24+8f8aNzmfgJwp4rFyQNkvxOLZGyv1BknX8n2t8NsGmOwcr
         cyP+CruL1AKAcF+WN2vOhxYoMjVGM2sJNcH3Qvvq3I34HPP/+Bycx60uq5zRFf31uNY9
         324GPyKF3lrJPp63g39aketLiFG96+5OnqteIMk+F/esVp5VYVE8Ww1ejUeP4RG0yJbl
         tjx8Zb+vG8erJBSgwTFJTTXMHp6ToHG+lcnYyOeRJzAvjgw8YrV2vvj0YcKliaYN9IbM
         N+tg==
X-Gm-Message-State: ABy/qLY5RVHMJjFxd3pSaoaigFdHjbjHyMrKG0UxoxoGCroRgQ+Q4ySi
	JRKYdlz0ZNW5S+vu7fhBnDg=
X-Google-Smtp-Source: 
 APBJJlEL0pC3JqIMQMikXRbZwitjsByBW5SfrCFuOY1Lr/Bl1Du4uLIo8HflRw+hJFgTQ5yz94uvjA==
X-Received: by 2002:a17:906:2308:b0:98d:e7e3:5ab7 with SMTP id
 l8-20020a170906230800b0098de7e35ab7mr1781567eja.11.1689261301300;
        Thu, 13 Jul 2023 08:15:01 -0700 (PDT)
Received: from localhost
 (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 hb24-20020a170906b89800b00977c7566ccbsm4043692ejb.164.2023.07.13.08.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:15:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	thierry.reding@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	Sameer Pujar <spujar@nvidia.com>
Cc: jonathanh@nvidia.com,
	mkumard@nvidia.com,
	sheetal@nvidia.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] Few audio fixes on Tegra platforms
Date: Thu, 13 Jul 2023 17:14:56 +0200
Message-ID: <168926127035.2339191.6180837272583412024.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <1688015537-31682-1-git-send-email-spujar@nvidia.com>
References: <1688015537-31682-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VEZZTJCKYY22U3BKSHBWBB65ZDB2FQI7
X-Message-ID-Hash: VEZZTJCKYY22U3BKSHBWBB65ZDB2FQI7
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VEZZTJCKYY22U3BKSHBWBB65ZDB2FQI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Thierry Reding <treding@nvidia.com>


On Thu, 29 Jun 2023 10:42:12 +0530, Sameer Pujar wrote:
> This series fixes some of the issues which were observed during an attempt to
> enhance automated test coverage on Jetson AGX Orin. Below is a short summary
> of the issues and fixes:
> 
>   * Sample rate coversion failures above 48kHz.
>   * AMX and ADX test cases failures due to incorrect byte mask.
>   * Atomic sleep in RT5640 codec which is present on Jetson AGX Orin.
>   * AHUB clock fixes on Tegra234 and previous chips.
>   * Minor cleanups in ASRC and AHUB driver.
> 
> [...]

Applied, thanks!

[4/5] arm64: tegra: Update AHUB clock parent and rate on Tegra234
      commit: e483fe34adab3197558b7284044c1b26f5ede20e
[5/5] arm64: tegra: Update AHUB clock parent and rate
      commit: dc6d5d85ed3a3fe566314f388bce4c71a26b1677

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
