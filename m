Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68653C98D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 13:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 406701832;
	Fri,  3 Jun 2022 13:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 406701832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654257075;
	bh=WHPr2vo2GeVCbfWZi2zHy7fawzKWEhNBqbkiVy2Ufu8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rpHn6w2r3fKZ4qeMctMtuoV5VEW6lhvYHGJAZFhwem1rwlQtoXDgp1luKKQLuZOFc
	 EEyoEcyaxX1AiHhURyZ3ipWlB+jzl1qr95gV145CDlYMC7R7MS9HDiWww840y/DbDd
	 upD71QzLhAf6mH56FtAwKZwT3+pjN79xuIJLibnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2CCDF800F5;
	Fri,  3 Jun 2022 13:50:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DF57F804CC; Fri,  3 Jun 2022 13:50:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4DDFF800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 13:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4DDFF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DgG9jRJx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DA71CB822D1;
 Fri,  3 Jun 2022 11:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70328C385A9;
 Fri,  3 Jun 2022 11:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654257007;
 bh=WHPr2vo2GeVCbfWZi2zHy7fawzKWEhNBqbkiVy2Ufu8=;
 h=From:To:Cc:Subject:Date:From;
 b=DgG9jRJxK+vt7W4q+kWEURW5pK7Y2iywnusSCjzSsh0hTmMjQZ6hYYHhc96WTzu99
 jCHJfIRm/xe8tNbKOkvEcRvEGkp8PG2QpgPqZ9O3ieWJgJ40c/aELa+YhLj2YD6Pjg
 2Cp+faw5MKzikQfDO3q6d/UitVneKI5uAmjWoQcuZLUDWdcZkvl5I22QvZ5qb9sf+f
 B3WWoSz57lHoOGIO/F2A6ZWmQcfUToX37Fm0u4CorvBYVNzwkd3hOvwc7GYs/oSNJQ
 +1weQpm3F3o6O4nWE2Uhi4IFgRmEkQX+rspssyeUKtCX978gIPjcJDUSBJUFNOQ1ff
 AeURb/tYOtEXA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put()
Date: Fri,  3 Jun 2022 13:50:03 +0200
Message-Id: <20220603115003.3865834-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; h=from:subject;
 bh=WHPr2vo2GeVCbfWZi2zHy7fawzKWEhNBqbkiVy2Ufu8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimfUtR3726vu3cjHNmYMgt5syn24y4mmCqacfkx68
 nshKJ4eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpn1LQAKCRAk1otyXVSH0BNOB/
 9hdmuwZBC0W6OA0aLcQ57tickrRnd1LQeN93hgNc7fB0lb2hPT6MH/Wk8AQttV6t4bBXPgbXmxjwv3
 FrYBafroVrxDBsts1ILxIiFriWfQVkjVr53dCpuSRL/MpF6j/923PLPQYMWQ9DbN0vdYKtQZHnJRNg
 ATyWmCLr/+HcAtkhKJ330kB50NR7URzeNK9ncPf4ud2EFqDxQsr28CdfN2fF+EakzSob3KGgJlg2Be
 YN8CRBLi+78AW2ja6Fdj8mxx3d/ViTLmfaVzmZX6rXsKukzpqchM5KetyvYjC5gZ19Cdd9J/qd8UCQ
 iFsD/BnJ/E+fGQiXIiYsOPejvUEfTj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

Currently wm_adsp_fw_put() returns 0 rather than 1 when updating the value
of the control, meaning that no event is generated to userspace. Fix this
by setting the default return value to 1, the code already exits early with
a return value of 0 if the value is unchanged.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 7973a75cac05..6d7fd88243aa 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -333,7 +333,7 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct wm_adsp *dsp = snd_soc_component_get_drvdata(component);
-	int ret = 0;
+	int ret = 1;
 
 	if (ucontrol->value.enumerated.item[0] == dsp[e->shift_l].fw)
 		return 0;
-- 
2.30.2

