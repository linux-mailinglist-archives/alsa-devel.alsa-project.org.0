Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1BC4A78AA
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 20:25:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F069D1764;
	Wed,  2 Feb 2022 20:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F069D1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643829937;
	bh=W4mcvws6I3QMBNZ+3URp8Jt5Cabe6dL9HYuQMwZpgns=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TyEDMiajh9JyJSh/kwCiHxnfBS4RgfYhoyyMJjF4v9zhWdPA8Kexs5ZK5goFRDTSO
	 Bs2+L/29S4THHVcsdRiur0DUe/x9VTHE7lQz+yS0JN0a2aplid7/y1+5SrTdGzLq2W
	 lqNFi95HZG4kRnBv0CD3t9VGxPU+jt1PEYcPDskQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC049F80508;
	Wed,  2 Feb 2022 20:23:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA839F804B1; Wed,  2 Feb 2022 20:23:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FAAFF80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 20:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FAAFF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jeah6QMu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C56DFB83256;
 Wed,  2 Feb 2022 19:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780C7C340E4;
 Wed,  2 Feb 2022 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643829829;
 bh=W4mcvws6I3QMBNZ+3URp8Jt5Cabe6dL9HYuQMwZpgns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jeah6QMujhrOV3pg4scLmXwMtJVBhxSAk10uArEBK2r6IJhKASNwk5FmgDcFI4TuN
 QDsE0lbQGtt4QoSXs17RjHahjvcMO0yUsYxflPWC8ogTUA0ciYaC/pOKQ5YsjkGMTp
 q/JT4M7ZmiUluh5XOfGsogQyeo+DceTa7ES3EpYlUFbK2TdFuyrrd+FP+mbp/bY3yI
 1rSvDAfzb8czVDzPlMeolC2ZppCcz4Y6mJJfAvSHIAzXKl/pLJ0MpE/+eTNhbkakvn
 TffnJSIgTULzs3q9YT5kEJzPpfVxPku2APN0YsrCBo6dSk2lzQGtEnrtqVMO/zEVBu
 mM1PUoLD5H7CA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v1 2/6] ASoC: rt9120: Remove spurious gpiolib select
Date: Wed,  2 Feb 2022 19:23:29 +0000
Message-Id: <20220202192333.3655269-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202192333.3655269-1-broonie@kernel.org>
References: <20220202192333.3655269-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; h=from:subject;
 bh=W4mcvws6I3QMBNZ+3URp8Jt5Cabe6dL9HYuQMwZpgns=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+tow4nb8qlUe9rWUctEDLdb+dmyyTyx6xdI1i6Nc
 4//3KNeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfraMAAKCRAk1otyXVSH0J70B/
 wPSjN9GfItOdUix5Ip90+2kGJhaHv8EYzovswdTemgUNZnAqx+OBz24fDLRy0uyCN33w/Vb4YHrPLy
 5Sg01ttpMUXN9shl51PEceLBnwk1wTI9GRByDN35xShnU7WjRIHXXJOPI8xZpc4aolheP7TRJOODMX
 8UHORimsXABUXqdbr67pK7Io0okJrCjH0lwtYTYMvgUWb/0EoEwOS+qig+xZPTBtlwJFZcjXig5enM
 IDw9jGC6CqoWuviSz5d2jd5H9mmZYOs6GjHH1wJD+5H6nSv509OJd4+qj3fOIX46/EZM+HhNlzulGx
 aN6kc/V/Qw6qM60bPi510+9o8hujkh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The usage of GPIOs is optional in the code so don't force on gpiolib when
building it, avoiding warnings in randconfigs.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 18159d560c74..196b5d9b08c3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1348,7 +1348,6 @@ config SND_SOC_RT9120
 	tristate "Richtek RT9120 Stereo Class-D Amplifier"
 	depends on I2C
 	select REGMAP_I2C
-	select GPIOLIB
 	help
 	  Enable support for Richtek RT9120 20W, stereo, inductor-less,
 	  high-efficiency Class-D audio amplifier.
-- 
2.30.2

