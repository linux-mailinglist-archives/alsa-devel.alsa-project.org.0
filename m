Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EA96D688B
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 18:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C6841FB;
	Tue,  4 Apr 2023 18:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C6841FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680624813;
	bh=0ApQ+qcVINqFdFbZP2USFgiBq84yNoutzzoVeoKV2MI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s2E7E/1ezjR4Hrk06GSPxFxQj665h2d+2kbRBIgRTBTi6wn5sugAd8s8UwSt84qI0
	 qCfzCDkoXv14XrPVK9JUiSspQAq44lORv5LvJVXD0H3nWKNT0Gqvlb4gY+naxefUto
	 YzZbzPo2qfQkUXReRS3X9/ffNtdT6J4Nx9hpQLkA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEB2FF801C0;
	Tue,  4 Apr 2023 18:12:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E84C5F8024C; Tue,  4 Apr 2023 18:12:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F18D0F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 18:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F18D0F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Z/iFB9SX
Received: by mail-ed1-x52e.google.com with SMTP id eh3so132714146edb.11
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Apr 2023 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680624751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEde4dazqs8JsdpTq9e976ZMwIeqbEXbVwUyENJtDV0=;
        b=Z/iFB9SXOwMEOpCmleolmC6l2LhvyD3XMh7WKOQsjMrvrxUfm8ennXwNohnigYv577
         B0hcxCfK9O73k2WCkdVlygKAlqYEEo72A8k1oNl+MsgsyTJGhgafCec/5kegRzRVLQXT
         OCOfvy9H+0BPY68owun4pHVK1Y2z87oAUDjbO42Onc2uTvHyqB3Pk9lYHWCIitiB3L+W
         6O1IIhVrJUlTQOnrp6Z+7/NZyyt//bCrMkRfulIemxRMeROJ6K/RYHwuMY84B7/V8FIH
         Esd2Q2uWSlAzo36yuNwBvSFHrCTIQzFqztfrFUU82/mwACajVe92PJiD1PZ2RvDi8R/9
         F1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680624751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEde4dazqs8JsdpTq9e976ZMwIeqbEXbVwUyENJtDV0=;
        b=bgLYG+1JRNl31hv/Fn3vQ9IUYyyRK9qtnvgt+Qz8Fr+g0oGzOdLcmteE6s+LoOekmV
         QRlcKpvmKq7gP16j0s+MUCAkJqt2k41FoHn9J5PZbW6qpDu7I9Maag3NO9fZ3ceFmR4W
         mrNYgYJU9NwMy+eHKam/vgVe7EoNZ0NlJAJ/GvPxVaHGoo0aaEytdShhsPWb5DNTKn7F
         Gx5sw4y/vDSz06NkJlg8KuyQp5fVi1oqWyzMJl2nQ0VX27fYJb2bvZA9rHG1zG0wEuUY
         rqvAbvUaxKDv+mUIJk44E/YMudi0z3DIKO/VpqZHyYya3soEUpRzFnk7IMXp0Gzz0TDE
         vfDA==
X-Gm-Message-State: AAQBX9e6Unbaff7CVWR8HoKnkNxNBhxufZ/XxJCLROIz6ZG7bFQ3hYRs
	E19XYurByZMp18npCDc8xOA=
X-Google-Smtp-Source: 
 AKy350Y7Q1EvlaIMvcDZzEKWbHr8fByK3cVf/k9Wwlk6Un7sG8GyowpBQ8MoX8kuqDf1J9EYnHhtUg==
X-Received: by 2002:a17:906:c217:b0:92d:9767:8e0a with SMTP id
 d23-20020a170906c21700b0092d97678e0amr102818ejz.13.1680624751436;
        Tue, 04 Apr 2023 09:12:31 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 jo25-20020a170906f6d900b0093408d33875sm6126508ejb.49.2023.04.04.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:12:31 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: oder_chiou@realtek.com,
	thierry.reding@gmail.com,
	Sameer Pujar <spujar@nvidia.com>,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	broonie@kernel.org,
	jonathanh@nvidia.com
Subject: Re: [PATCH v2] arm64: tegra: Audio codec support on Jetson AGX Orin
Date: Tue,  4 Apr 2023 18:12:30 +0200
Message-Id: <168062474005.2644933.17495662209402914912.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <1676263474-13346-1-git-send-email-spujar@nvidia.com>
References: <1676263474-13346-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KANU4WUYDIMKSUN4GFXRPEBDZOEGUJF4
X-Message-ID-Hash: KANU4WUYDIMKSUN4GFXRPEBDZOEGUJF4
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KANU4WUYDIMKSUN4GFXRPEBDZOEGUJF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Thierry Reding <treding@nvidia.com>

On Mon, 13 Feb 2023 10:14:34 +0530, Sameer Pujar wrote:
> Jetson AGX Orin has onboard RT5640 audio codec. This patch adds the
> codec device node and the bindings to I2S1 interface.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Audio codec support on Jetson AGX Orin
      commit: b903a6c5aaa862f8b88f4be4431ccca3b6fbc187

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
