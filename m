Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52277AB7FC4
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:06:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EAFC62CC0;
	Thu, 15 May 2025 10:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EAFC62CC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747296098;
	bh=8n8/bY5LAWpyfxrimtYmM53zT/Z/g9DhZOdMQxbL7qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K2mPqE6rAZZNEohjm6Ool2LlrdgmbB9650bYZgd2Ew4RF8PfpGA6EY1v8mAuiTNvl
	 UysvHqhvj+GBgTot/Xu9fRm8zh+s4JlPunFWs6T9wU6CCmPj7jlKnfRrkKOE1MJ7rl
	 v8Y+APxzpA2Yky5zywvyxHdxiFfnyB1Dkjf9uc5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71CCFF8069F; Tue, 13 May 2025 22:47:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD72F806A4;
	Tue, 13 May 2025 22:47:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73AE0F80686; Tue, 13 May 2025 22:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3D15F80679
	for <alsa-devel@alsa-project.org>; Tue, 13 May 2025 22:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D15F80679
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nRN803rF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65254614B3;
	Tue, 13 May 2025 20:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD33C4CEEB;
	Tue, 13 May 2025 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169226;
	bh=8n8/bY5LAWpyfxrimtYmM53zT/Z/g9DhZOdMQxbL7qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRN803rF3MXyZo/sCduaCDqXHx54TbHvRsx8w0qF/iQNvLa/JEtjgSsZTNFXax0m9
	 EVsxISYB+ng5o4jPweTZk4/SR/01QKV+2x3YATBZjKPFV5muyrq29w++yXuPHjjXuX
	 AOiYTOoxHnkoQ3QYmsa3abJ3+G+NI80sKbM4fe7DYdNplJ+so0p3v6KGf+Tdw4pwOC
	 22xRL+O0l7l9eCKips+B/n0rsDupZB9R7bhn0d6BLBMPZ8fz4V0ymDzdTdsSdNVDU9
	 xxQreElLyMpJUiUw94X0kEc9Dc6x5rFkqXc+UrcfNnRL7TjoaSz7d+QS+yDy3/fNRV
	 de0w1JcirHYgQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v4 0/5] Add DisplayPort sound support for
 Fairphone 5 smartphone
Date: Tue, 13 May 2025 21:46:41 +0100
Message-ID: <174716895375.39748.1659820530327447413.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BRB7QSIDO32WO2JLAONPOUJAY2LQMVL4
X-Message-ID-Hash: BRB7QSIDO32WO2JLAONPOUJAY2LQMVL4
X-MailFrom: andersson@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BRB7QSIDO32WO2JLAONPOUJAY2LQMVL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 07 May 2025 10:01:36 +0200, Luca Weiss wrote:
> Add the necessary sound card bits and some dts additions to enable sound
> over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.
> 
> The UCM files can be found here:
> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm
> 
> This series - in spirit - depends on the series enabling DisplayPort in
> the first place, but can land pretty independently, especially the ASoC
> bits:
> https://lore.kernel.org/linux-arm-msm/20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com/
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support
      commit: 8fc88fbd471044d66cb2fd85dc0d431866ed7448

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
