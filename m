Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D66714A60DD
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 16:59:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77F6F181D;
	Tue,  1 Feb 2022 16:58:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77F6F181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643731166;
	bh=VnWhYXoSublRCB+1wcOOpYhqio7frWE6T8zFex0MlxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQDOeoowgTwpBlXNfWMVUYC/Hx7zZksSsKNKim//89N97vAA0mzbG9M6R/f74vE7P
	 Xgbk1MJsFZW3JyaBGe+4M0qhh5rJBqbvlXL+OLRPS7Ado4jX0R/YRjI7AZebVpYpM7
	 5n4bOvtklOyRXa4PTjgW5go6PwWq7kblF22fDijg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09204F8051C;
	Tue,  1 Feb 2022 16:57:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D95EF80139; Tue,  1 Feb 2022 16:57:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C53E9F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 16:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C53E9F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qyDH9x0r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 731E9B82EBB;
 Tue,  1 Feb 2022 15:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A160C340F2;
 Tue,  1 Feb 2022 15:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643731036;
 bh=VnWhYXoSublRCB+1wcOOpYhqio7frWE6T8zFex0MlxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qyDH9x0rAubhmtN+jqn8UpfmWNRQjRyIlv/UFEuCuh9GuA2OHYdkAPqz0cB5XeWFu
 iuGD9pJ8JpxZvoPuGMTh3S/Dm6/MLjWcSPQcGao0BrsJf8fQV9LsLXRe3mvNM6bt9x
 S2+RY+ikcfmg1mE3+k9AhRSxqfQeypflHTZ3d9Qee9dPrXFjNJU28yZzU7WEJPbmx0
 UJUxMAvMdJW5wyvHWhpl1l56v38bf3uwHB7yB1MJKwhfxjVK+oUhMHkxpcNEiKNmGR
 TByrObquwXvGdofawh93oteISlUvrCxv/msUK0SvXHNRW5ZZ1A3M1BE+Cv16R1Jvsy
 pbCavoMmzQNRQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 4/4] ASoC: ops: Fix stereo change notifications in
 snd_soc_put_xr_sx()
Date: Tue,  1 Feb 2022 15:56:29 +0000
Message-Id: <20220201155629.120510-5-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201155629.120510-1-broonie@kernel.org>
References: <20220201155629.120510-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062; h=from:subject;
 bh=VnWhYXoSublRCB+1wcOOpYhqio7frWE6T8zFex0MlxI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+VgsLu4zMn5YXRfnMlkoi6j6z/SZ9Iy/LLhl7L29
 4B/A656JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYflYLAAKCRAk1otyXVSH0IpLB/
 9YQ+9hIYFMiyjlW9PEgtBYLZh8roYtm/kwoGkde9MmPGlh7SxACNvDW/Chh0tEcFkERC0XxyTW3z0S
 OvzjU+KECDOtlqXho/YTAWdX5dpdVE7TS7xsTH6GHKylJzjDpTjvrEgKpY6NIg0F2SEPkXDZM8eUwl
 VyWeOXCmlgLqJ86E6+2uwRhvRELkU+KNrrp7cYyiD5OQzvGHyEBa59lyqwO2dhrU9FT8cIO8YNDtgj
 WkrtJIPqOB65fEltw+w7bC6ylNb7iV0YiAZStnC97dJpM0UoEPxCxASL0ND4+FkKODl2VOe1k/8/Wv
 369Vu1zpxlhWaS+cIpKUOQRF79LbcS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
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

When writing out a stereo control we discard the change notification from
the first channel, meaning that events are only generated based on changes
to the second channel. Ensure that we report a change if either channel
has changed.

Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-ops.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index fefd4f34cbc1..6b922d12afb5 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -874,6 +874,7 @@ int snd_soc_put_xr_sx(struct snd_kcontrol *kcontrol,
 	unsigned long mask = (1UL<<mc->nbits)-1;
 	long max = mc->max;
 	long val = ucontrol->value.integer.value[0];
+	int ret = 0;
 	unsigned int i;
 
 	if (invert)
@@ -886,9 +887,11 @@ int snd_soc_put_xr_sx(struct snd_kcontrol *kcontrol,
 							regmask, regval);
 		if (err < 0)
 			return err;
+		if (err > 0)
+			ret = err;
 	}
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_xr_sx);
 
-- 
2.30.2

