Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 407AC6A2F74
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 13:50:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26D3084D;
	Sun, 26 Feb 2023 13:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26D3084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677415806;
	bh=emNCSAQUMhHTUG3lVSOQb0USv0AarsCt9Z41ZbfcyGE=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pRzbOozHdXqS/H0WvB8umw21Zis0EdoYMw9EaylygfevcWvbW6g6X1l3rAtMkIEXs
	 FtPbgl+eU3gB8vRQdiEryhEsKzb6coBj40Qs4ZtWIFEi248U7HdMS0sMQgZQD1vgkL
	 au3o7TunThTVugMR9EEbqDM+3MmYmheOuyLWwfgY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88667F8052E;
	Sun, 26 Feb 2023 13:48:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 009EAF804B1; Sun, 26 Feb 2023 13:48:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19A75F8049C
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 13:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19A75F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eWex+5QW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 03598B80B46;
	Sun, 26 Feb 2023 12:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399FFC4339B;
	Sun, 26 Feb 2023 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415692;
	bh=emNCSAQUMhHTUG3lVSOQb0USv0AarsCt9Z41ZbfcyGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eWex+5QWuA6TZ8OOVdB12xYiI1kQADxNAwu5NhBut5ClnmQAbMMYw8CFHq4g+xOj1
	 jrK+VC1MLG28KEYsp7jQ5TiB2zMQZ2QT3R9Oz5Fgv2V19iZgVndui5Sg8IV+Ds/Xn+
	 Q3gqaW82BfVvJ5IaOcD7cL9UhWCRpHsERZjBjQODzFxlZSzovNRoYKL9hddBXPy5DW
	 h8UVQj+7rSsRSjCE8S4XzPLvVPtt2HLELc36tGR3+CH567Wpln+GSf2DI1ssiYQgNy
	 DiMueKkAcJPTEDbv4VAL24Fl07op9FueCfcihpML+kQjKsKKdXCGGUodH2nVDxV6bD
	 iSBocuDVAavjQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 26 Feb 2023 12:47:58 +0000
Subject: [PATCH 3/3] ASoC: mt6358: Remove undefined HPx Mux enumeration
 values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-asoc-mt6358-quick-fixes-v1-3-747d9186be4b@kernel.org>
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=broonie@kernel.org;
 h=from:subject:message-id; bh=emNCSAQUMhHTUG3lVSOQb0USv0AarsCt9Z41ZbfcyGE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1UCvnHtC8Y2FK2g3UW6t8hM+fV6KPpUPjMtvnTx
 6rGLlNGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tVAgAKCRAk1otyXVSH0KsZB/
 0S4IR6aezaldfEMIQi+pLvwztcvY+0JlipzO8KvE+KJaAcGy7xMknnanzY+SUc8fT/kODECUFt9eQQ
 YRpQhGHoTxzbJ7nLHXkU1L8qtW0KPKQTmii6TOcyCXdvfMPKIMpYMcyqjv2TUlowRMAfl3Ea/kBkYl
 OJ4PHrpQjOoamOiHuDs84/KrG/cCXhcXcXwl9pPBQLimzQjOUu4LBw+FRN7AJFDZnTqF3hjv2+UJVl
 xa1u5E5GNuIjoX6BftzBZlqtBr08S/BWkTiwrja04VIW0qldf1bHVg5AXXQ8VgbBYvpCjwr2QL8ypT
 W0EpsI82xGERoJQcHv8w3iMJI8jJqC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: JLROZOIYWCCJH5WJ6IZXNCU5D5CY6QD3
X-Message-ID-Hash: JLROZOIYWCCJH5WJ6IZXNCU5D5CY6QD3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLROZOIYWCCJH5WJ6IZXNCU5D5CY6QD3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The HPx Mux enumerations define values 5, 6 and 7 but describe them as
"undefined" and map them to the value 0 on writing. Given the descriptions
and behaviour it seems that these values are invalid and should not be
present in the register, the current behaviour is detected as problematic
by mixer-test:

# # HPL Mux.0 expected 5 but read 0, is_volatile 0
# # HPL Mux.0 expected 6 but read 0, is_volatile 0
# # HPL Mux.0 expected 7 but read 0, is_volatile 0

Remove the values from the enumeration, this will prevent userspace setting
them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6358.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 89d0dcb2635b..b54610b27906 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -637,9 +637,6 @@ static const char * const hp_in_mux_map[] = {
 	"Audio Playback",
 	"Test Mode",
 	"HP Impedance",
-	"undefined1",
-	"undefined2",
-	"undefined3",
 };
 
 static int hp_in_mux_map_value[] = {
@@ -648,9 +645,6 @@ static int hp_in_mux_map_value[] = {
 	HP_MUX_HP,
 	HP_MUX_TEST_MODE,
 	HP_MUX_HP_IMPEDANCE,
-	HP_MUX_OPEN,
-	HP_MUX_OPEN,
-	HP_MUX_OPEN,
 };
 
 static SOC_VALUE_ENUM_SINGLE_DECL(hpl_in_mux_map_enum,

-- 
2.30.2

