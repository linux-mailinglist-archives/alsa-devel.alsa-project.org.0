Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB6C953B9E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 22:42:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF642BDF;
	Thu, 15 Aug 2024 22:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF642BDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723754520;
	bh=zLGOMGoKwUCFDdiXn3enjJ0O9mURCn4+cOCpMaC8Qy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L9tdQ7JqjbcyjHMFlil9Q6kHGZq6IAAvmu5U10oyT38Kv5/5P1xyQ+ywXrv1/8f+X
	 Cv6lgkstAoe035Msijf4Mbcp0n+17adPnVz4UDA4nhbyNFoxp4DgqEePbuG013dikT
	 e3GSJ5HpJwIkBUl1JePk/SSgVV+gAoJ67i798Z74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46BC2F805B3; Thu, 15 Aug 2024 22:41:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF201F8059F;
	Thu, 15 Aug 2024 22:41:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C5D5F80423; Thu, 15 Aug 2024 22:41:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03ACEF800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 22:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03ACEF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pj0bRWdl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3447561FE5;
	Thu, 15 Aug 2024 20:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5D7C4AF14;
	Thu, 15 Aug 2024 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754474;
	bh=zLGOMGoKwUCFDdiXn3enjJ0O9mURCn4+cOCpMaC8Qy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pj0bRWdlmEwx7zvGEBSxn0Aw8qM2P8v0okGRFRsdybaTbLg2B6hrwn3ziBRbmQxuu
	 Zgefx9+PkwrZ9DT1Clo5UlZqjp17rqVTIsNsN2khziIp/Lsj0CYwciKPk8LIwlvCF3
	 RhqKuIMTJYlQqmoq+TIFiKKaO8UzK8B65BydIarUDzwm5/c3LZwIPP//vsjmdMVafj
	 37cQCONun48HfZLuRjoaRApD8dSL4dKuehOiR46+iaRxTrcmydRKI/m1QR/aNOAXfJ
	 g7y/IDja9PG/RkzZJLevsH4SpWzcjK5KE/MxC4r3qho8rgruwLkzBj7MPbncAHwfp1
	 1OMiRKewIPI/g==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] soc: qcom: use scoped device node handling to
 simplify error paths
Date: Thu, 15 Aug 2024 15:40:29 -0500
Message-ID: <172375444834.1011236.2412246368890909822.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
References: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CUT5ZZPZWZK4MCYCQW7I7P6NGZCE36OA
X-Message-ID-Hash: CUT5ZZPZWZK4MCYCQW7I7P6NGZCE36OA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUT5ZZPZWZK4MCYCQW7I7P6NGZCE36OA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 13 Aug 2024 15:09:46 +0200, Krzysztof Kozlowski wrote:
> Use cleanup.h/scope on device nodes to get rid of of_node_put(). Code is
> a bit simpler.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/6] soc: qcom: apr: simplify with scoped for each OF child loop
      commit: 6c26d9c764c62343722d6ea6c9e4c7e65989f634
[2/6] soc: qcom: aoss: simplify with scoped for each OF child loop
      commit: c50203cbba1573546f115330530d24382fc53f09
[3/6] soc: qcom: ice: use scoped device node handling to simplify error paths
      commit: 877840f13bcc96e05aca2e1e6cc0f957afb788a4
[4/6] soc: qcom: ocmem: use scoped device node handling to simplify error paths
      commit: f4c1c19f5c0e5cf2870df91dedc6b40400fd9c8a
[5/6] soc: qcom: pbs: use scoped device node handling to simplify error paths
      commit: a29e97bdc160aaa27187c7be3bcd052af66c027a
[6/6] soc: qcom: smp2p: use scoped device node handling to simplify error paths
      commit: f728778272242c84d36682c0aabbb845195e745d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
