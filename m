Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E9A5742B2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3728817A9;
	Thu, 14 Jul 2022 06:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3728817A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772768;
	bh=dt8pDqk8iKTyANiXWzkfAhvww3xMsxUF+gbazu59Dis=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VtxqbMpPiRzqi3/DtULSwtd+UaIpfUyp5YrnTa4QQy5fhMImsq66Y18sCjW+jUtaw
	 3S6+D1cy7yLZMTWPKFUC+GgwO/kh97mrHpR8z+V/ZtBlK83ENXpDREU7vUlB0x90Ff
	 sEuhNs/wxx190PgpT57oqCqRjBiSb193eK/dO3a4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2AE7F805B0;
	Thu, 14 Jul 2022 06:23:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 157ADF805AF; Thu, 14 Jul 2022 06:23:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FEB0F805A0
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FEB0F805A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PSJXdR4C"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13F2661E59;
 Thu, 14 Jul 2022 04:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5B4C341C6;
 Thu, 14 Jul 2022 04:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772576;
 bh=dt8pDqk8iKTyANiXWzkfAhvww3xMsxUF+gbazu59Dis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PSJXdR4CKJlvx9qYNN4saKAJCdyWWxGsD3HTFG9eZi5rz82LQhSsOOBNXDqXJ75eN
 YWg9uYXKAmcPYYiTVWqu3tTHYxwi9+0p+W5H8TD+jJY50lNSAKfT4M22K4axex4tWY
 XJ/QLuu2uiZ1LbxPN4EUSGFNb9imPCg4IiY0Ljh+SqgKUxlaMwsh4uWLjuTzgwT8sW
 DpINz5cZT9Oc1IozTknGlobU/p7Di7oD1jCyVeMiYtJQlS63kGSHSPy8CTcUrBHcrE
 hzkEMNAhWanOT8aYp9Fm5CjzM0DnzvA/YCirejGS6HbK/tSXqjmuh1UerZ0e4dzw9a
 bKDw1u0XfIieA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 13/41] ASoC: wcd9335: Fix spurious event
 generation
Date: Thu, 14 Jul 2022 00:21:53 -0400
Message-Id: <20220714042221.281187-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit a7786cbae4b2732815da98efa39df96746b5bd0d ]

The slimbus mux put operation unconditionally reports a change in value
which means that spurious events are generated. Fix this by exiting early
in that case.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220603124609.4024666-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 12be043ee9a3..aa685980a97b 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1287,6 +1287,9 @@ static int slim_rx_mux_put(struct snd_kcontrol *kc,
 	struct snd_soc_dapm_update *update = NULL;
 	u32 port_id = w->shift;
 
+	if (wcd->rx_port_value[port_id] == ucontrol->value.enumerated.item[0])
+		return 0;
+
 	wcd->rx_port_value[port_id] = ucontrol->value.enumerated.item[0];
 
 	/* Remove channel from any list it's in before adding it to a new one */
-- 
2.35.1

