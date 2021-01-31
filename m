Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 746D230D3A2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 08:03:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA71171B;
	Wed,  3 Feb 2021 08:02:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA71171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612335787;
	bh=4Hk16/Z/TnNTjNUHFekBkHF+QVrL5THkYJJUZoI+SFA=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Sg7fV+7eiZmhC2aW88iRxsG50z++bVbbIlL9ISGuVnkimAe29rMT8/9B3O9T2T+0M
	 6voKcjYreBuGr5716ZL1fw4plpAg232MImf1bW7D1pq+dU5LxAu6oYYK0gkwBn4ob2
	 FXc08NnbA1LErCbLrA6NLCIc456VRtH4QMT4vQrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67852F8013C;
	Wed,  3 Feb 2021 08:01:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79436F801F7; Sun, 31 Jan 2021 19:43:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sonic314-47.consmr.mail.ir2.yahoo.com
 (sonic314-47.consmr.mail.ir2.yahoo.com [77.238.177.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F298CF8015A
 for <alsa-devel@alsa-project.org>; Sun, 31 Jan 2021 19:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F298CF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="Vn333jhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612118603; bh=vDNOkauvqtIuGahnq6DC/sXQO3S+/aKLSOLNyCiCx9I=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=Vn333jhiq6HE9SoVMBiBX1eClvTur5AfoQYUfRoFZL13pxqkwKygKVgBpuvslKLItFJ9yMG7VFF6Atp3ubqkIVDv5+IX1pZR0jYtlcpWKF67R7swcTxbQTWUCQFuMSQiIGBYIg6/CaNFVh2m+oNf3udKICWDADI9o7KCakwrccTNllpOYoKNMje5eTc2emGN+TsGdxvX8ed2IfkulEskdA193tuOFAnTcZfHMagLZoJrWUb+KnWcd/P8luBUBjDeeBDR5o6y7wvIwbC+GK+AYjk6Q0w1qxkG0Ls8ZB8/zpzCrmnQC4RVecBoK0oH7CKm3H2w7mvRLjjPlrYOZFBHsA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612118603; bh=/gxaALVL1VAlGPLtcCxTwXQOjSr1CJy8GkQmVzMVf0c=;
 h=From:To:Subject:Date:From:Subject:Reply-To;
 b=tYfPBFLvyktL5VpPNPliCZ98VW9Ah3mhxleWnqaph+KsdO600kOtJR26Y7VZG+8IwXN8SLe4vClutUkYRSQKqr+hGc4lezGmg0e7CELe10KzTq0XCViAk14fMOSaOGxiZkw0a8ArF63D14jWwhJhQJAYuZpscq+GkoEqSRHUoze16sMJY5O0IbaFptsdhwE4FXEXYgRp7D1mthnv8QuRXdsiQfyrNARUagWtZtC3+JXDRFz9mCHRg7Bk/8/YyxE8pKAivJgKRfV71D1+fe7D3nneG8JMIYGN1MA1Y3CuLZ+nZuBALXHBq0CwTiuYdi0+BaijDligvT9F9c+8/a45wg==
X-YMail-OSG: V_XokbIVM1nSRZvreX8nrxiMhVmodyutzDVLsMH2JXyvSdECtKwRhzZd71Gbz15
 Bx8S5DWnzmii7_a5s8zhT5ZBjIGZqqq1gYvoEcKONPBq0K.1folHTg8KKuGpB6GSa.qoMXwP.lty
 0IUXHLQUhNvwC5FC6PAXP.KZiGxFsXXuM9alLTE3tSVHWDEOAaWkphLzqPsfJs8m_hzxC4_aCyG3
 wDP3aH8poawOtASNMyYtqdc5MQd_6.gqW2wtxATIpBZEm_7qaDynB9euLd6JH1bK4H9cwFElBKyP
 GiSk2b1dyXyLbk1ZMiciHRCglyh6M23ntxV_JxBIvsFmp8XEtifDpVOtzrXbsizv5xYbrAEyqZ74
 WIyfE03v2mnFLEiZ2F4P.n1tymS.svcDftGNPlOjPNEDZrNjMrDRyhxc0pFjJF6_xZ4fyltlVe.b
 hG.Yz_9fGznjktpKWice7RkBi9kmWRrBSdvjQGKvNpg8Ou.pNH2Jz6JBQyyYVslRFWedDkSp_fIY
 ci4oDi40qg9.UO7igfFte9M.KYqDpsVqZSgiHccDHMUI8yfVc6ZFmpNUnr0HzKi.DnWhI_zS6EwF
 hfmhkIPPJKSZ6drWtUMmDv89Pq3h3DoXBYmjL1eS2VOJU4Q5Ry7.p0Z3E0deOq_s_y_me7QkgXb7
 0AJ_WxG4R6cL4x8sAiztfORqPoc9HffrlRY5ZKlIgF7RBT967Ka3N7zvQQjscogOKHdPt30HTt55
 mq_WDpA.sjiwJF9xRrxb7_K7dfhgnxtsL5ATR77pOah2.ak7ZB2Q67X3gf26kMlOpGkvdh6oCFZv
 EQNEDxCgpUlA8LsLNyZFBW6DJT_i.4GMmC7mXrTmYcEqG45Q87ai7OoOIXjtEtLMuGO9RYwkNBF5
 qbC9f19KHA8MzwRLpr81o6d1lxD4GAgyFTA4WgBkCleA_ZRN8vriUdDEiQlM3f.mzIasBJsODaqR
 u6DuNpq_MLxj5Zb.qBNNzThiS.ooUilkBYGNtjU49xTUCpM8ESW5z3F9iB1Kxu_b2PR3c3Q8aw.N
 6KXpgGHVeau65A1NZI.gBt.sa9JaUlL6EeGNQDNLsVsKTQ2Dw.vCsdfODJrnfHWeF3ZKBA.5WozM
 qYUK9.qcuBJhDH4vTIy8nkbL8HDBa4dNyNFCnIhmHLH2v_2V9uLn0T1w_t3zRBZGWsc.pR08KySe
 LLkp0zIC376d3iPSY6yVcMBPega20D1sTnEUEYZyu_Z_bENEfQ9TGcIAsXAtmWy2BXpUyKGJZVPE
 BB6VxqqYlHo3C7eJVW4TkldtZ8RZH6An.tNlU..1gUBAWCLT4rJmnCicHMN_Wj3qrbkP0xBlzunP
 6sbwe8DS6GT7jWajwaEeWiKo_hSvmg8JbOfXNi_4cT4goaEKj.1tWsknHNXRMMmM.jKPIYrZEMHc
 GWp.9Xxe5jLwdCq3LaBLWrqAsiDx143vIQ1JthT7iuZ.ODdvzJnQWSL_0hjYo_TAHXvuMP3d91Y9
 QWoPNF5WsWOMLzQqkZA1gSXbACbnF6P9QSel833G88Zld9hfvxV9DpCmWL4sdIU.DVL_oBS1r3o5
 jfaGZetLIN98qyWV6GNIydsVfhqlu9sCuSScIpbQK3sMhz_LEVzVDI4mJPeYcvGkrdxiGPJxvQk3
 4q4pgtJy6.619mGVYW2Q0yAlcieGMyeSPVHlVsU3un.Gb4aKo4x31_j5ZDLrc1n8EwZpm2s6o6K_
 65f8uc7982hAkpOh3FxvVJ8ACxvH.EEM3Y_WoGSGlhaTLhZBqDgtVJbck.jSOj9t.YguH4RF82DC
 Lf2sOWmnyhTHlVEb7OdkP8yyiaZJeBrRA_JzzSJ9Y4kY1WdqYu_mNxQZA0yMRnb9UGXNUjMW.kas
 eckCFoqsiLQrt7PFJDO.ftuBivxF7fxb8cHKXg_bynahdpa7TSX6sFzAMC2gyy4hq7DWoiWbsSUV
 R53zGT7jE7dckG00NdqW4wjLWeWTGOGbIrwIz2k04TcYN.BnwCJLjMFcEvM.zL4kRAEZJ6wCfKuD
 oiaD_tNLCaXwCJi4e3VLgVxygGB0RhNoi3zDu.wgAJwP_PL30VunqKkYoz4aYfZhev1vvJMRD9d8
 rfP.yWiC7wnodRA0mWablEPpZW_ziwtSom8SJZCPGB6CchXmP7tNzeZFOIG4ef2HkYpb43HQBjoM
 so23VQgTwOrfP8lwPvwT1c2VFJ5N7rnu__M49CPj9tvFNvQG0x9Oxy1kV1pOlODIpyeZfQqC6wrh
 3AhlePfRQ_bx3uXjO8oJo1xnyvZ0S.JXS.c8xzVKpakaLzTN2lP32w8R0mpysmSwsg3b4I6mXtop
 qkVS7ZY6pl8sCTL530a2JLg5CcD5pcaSrjS7y07agY6vhDGvt_EQx0_1vJ3oBGMOuh.vdKynNr15
 xbNEJALr353lwpg9y2yQej0BnvMZO4Xr15m2LhzX_wLFkauPTtdKDI1w9P0NYKO.jzgq33XUTn45
 FCJFiuA1sBg846dy.ACtNW99zOBeRMlnhXR3F_rOMU4fJMSjf4HGPX.NcwrUxOEQR_9jKz1dYx9j
 zGRyI76ziTP2Y6e1xLaaG2joeJCohNwWvD0bxGSmoahSymQ1_3CQGezL2ttdPeEb08TjRFcgE6xO
 QGl3Neeaasqqu.3bb0Yt5cQKEoY1ZSq1oNMU3wfwt3xTzjXQtc_pL3SsjeXs1SadDjFnacWq8I2x
 0pqsRQdO0rowgetZUhP.yynYxqQRAXgmxk3XSL4BC0CDoHeY8zDHPRYqdRrtfQN9DmSWgl4AlFPC
 .Wh2idTF_O2evhJ0Vw5IrmtXFsmY36J6TaoAOkyjFTwQIyfcHpVNqQY0OGoB_X0jZHFqu1Pll0bC
 FcFGwVGJ0xMoTzidCV1ZDk4HaYMrs2LWpX2EINpBimxKKb04AKqPhJVHsdEr3LLDnBdo4OL2irCl
 IfDbX5Nv_7dIfOGQmDdDmY20YKVXT64BMJ8s9UlQZq7vmwqWnu0zkLHHf1G2bZxvbKbUEvPCKzZi
 evfWmCOjX3CZDfKmMhEVQvwPnZg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Sun, 31 Jan 2021 18:43:23 +0000
Received: by smtp407.mail.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID e16a2e904335ed9f41206b782293961f; 
 Sun, 31 Jan 2021 18:41:21 +0000 (UTC)
From: Ion Agorria <AG0RRIA@yahoo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>,
 Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/2] ASoC: tegra: Add RT5631 machine driver
Date: Sun, 31 Jan 2021 19:40:59 +0100
Message-Id: <20210131184101.651486-1-AG0RRIA@yahoo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20210131184101.651486-1-AG0RRIA.ref@yahoo.com>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:01:31 +0100
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: Ion Agorria <ion@agorria.com>

Adds support for Tegra SoC devices with RT5631 sound codec.
Playback to speakers, headphones and internal mic recording works.

This driver is used for ASUS Transformer TF201, TF700T and others
Tegra based devices containing RT5631.

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: tegra: Add binding for RT5631
  ASoC: tegra: Add RT5631 machine driver

 .../sound/nvidia,tegra-audio-rt5631.yaml      | 134 +++++++++
 sound/soc/tegra/Kconfig                       |   8 +
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_rt5631.c                | 261 ++++++++++++++++++
 4 files changed, 405 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
 create mode 100644 sound/soc/tegra/tegra_rt5631.c

-- 
2.26.2

