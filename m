Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F08953BA4
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 22:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 472742BBD;
	Thu, 15 Aug 2024 22:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 472742BBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723754542;
	bh=99puEiYfn5q/7K01azkENGMe1+O/ZL9Ew0Yw9gh+GPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nCZyKwR9oii5xALj9s+l3ARIrWK5KEWdB7rf9O7JDFkdnHN76rGx5l0JtdaczbZaO
	 yreByxzunWfue1+QSsUYVev8dWgwX8KNbLo73sSjebSCi4J0rcLg+/04z3xxTLFrXt
	 GtkqHJwZVstVwE0MafHc30/63+KSNqHcwyVTwR6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCF66F805AB; Thu, 15 Aug 2024 22:41:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E009DF805C1;
	Thu, 15 Aug 2024 22:41:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C433BF80107; Thu, 15 Aug 2024 22:41:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B93B0F8057A
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 22:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B93B0F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WwtYg+Fr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E950BCE1E05;
	Thu, 15 Aug 2024 20:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CCBC4AF14;
	Thu, 15 Aug 2024 20:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754500;
	bh=99puEiYfn5q/7K01azkENGMe1+O/ZL9Ew0Yw9gh+GPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WwtYg+FrmwJ1+DtOJDq3tvnd71xwf0r16EnhnCSqlvCBkpyEBVsN+xmdEnv50Ngcw
	 5Bufav1hT6I9bQiDJdtOlhPvGAmjix33qvhrIW15J+dmsdT9owDmux31NiGYIgwTgF
	 ZwYKnK+14wvp/+vVpgmJ0lvnHMw3xS4Rvy49W/I1yRPowy9jASbPXLVsWM506/+n1k
	 ayYE29z+4koutxE/Fj3Cirsy8mLBwkQel9Xkbf0nXvjRKI+fDEzNWcK5T80LN96PYX
	 /7Zi8tbsz+y9vy+9x1elt2otYPZyTFAqly+bpg93Nrq7N/aLTEqlzxGyJCIJJFcOqo
	 Fx5naxR4U4nAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	srinivas.kandagatla@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manikantan R <quic_manrav@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/6] ASoC: codecs: wsa88xx: add support for
 static port mapping.
Date: Thu, 15 Aug 2024 15:40:50 -0500
Message-ID: <172375444802.1011236.13810877795338662540.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GWQCP4B7IS5LBM5C3YWXY3SCQ2WUS7W6
X-Message-ID-Hash: GWQCP4B7IS5LBM5C3YWXY3SCQ2WUS7W6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWQCP4B7IS5LBM5C3YWXY3SCQ2WUS7W6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 27 Jun 2024 15:44:37 +0100, srinivas.kandagatla@linaro.org wrote:
> Existing way of allocating soundwire master ports on Qualcommm platforms is
> dynamic, and in linear order starting from 1 to MAX_PORTS.
> This will work as long as soundwire device ports are 1:1 mapped
> linearly. However on most Qcom SoCs like SM8550, SM8650, x1e80100, these
> are NOT mapped in that order.
> 
> The result of this is that only one speaker among the pair of speakers
> is always silent, With recent changes for WSA codec to support codec
> versions and along with these patches we are able to get all speakers
> working on these SoCs.
> 
> [...]

Applied, thanks!

[5/6] arm64: dts: x1e80100-crd: fix wsa soundwire port mapping
      commit: d374fafd8972895eba01ebd69c993cc7d80c084b
[6/6] arm64: dts: x1e80100-qcp: fix wsa soundwire port mapping
      commit: 6e229f9118438af09b4ac6a96313c32f33027e5a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
