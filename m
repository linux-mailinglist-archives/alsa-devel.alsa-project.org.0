Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A10EC72AB27
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 13:38:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C069209;
	Sat, 10 Jun 2023 13:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C069209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686397088;
	bh=Am+vzGKmVo0IASHZdwq/uvtpaB5ByDkRqBV+FrBhOPM=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hw0BfChcg8Rs0tAxp4+6OEMHXSy1IPP75yCVxDd3SL6M7wGD5rav3DNmEL0u/V84e
	 2+AmLXlPhQ2kR+shOkfj/1NIlpO/3C6Yx8oC4J+PvVVJV+AC3thFNuijfR8wJdXjlk
	 e0PIeJIFhMqkttTdGRlPU8bMJcAR80xY8ZX/9luY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BE4EF80254; Sat, 10 Jun 2023 13:37:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61126F80155;
	Sat, 10 Jun 2023 13:37:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ABD9F80199; Sat, 10 Jun 2023 13:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D719F80155;
	Sat, 10 Jun 2023 13:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D719F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=reRkaaCo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1686397000; x=1687001800; i=markus.elfring@web.de;
 bh=Am+vzGKmVo0IASHZdwq/uvtpaB5ByDkRqBV+FrBhOPM=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=reRkaaCozxCo6zzLNtBBJQBMLLJS1x6NpknoO1Hon5t++OLBVOArcUtxN4ApPCZPo9TicJm
 rOfgPMQdH+V9Zq/ToD5KWZGT4slpPPdCN7gGOe8PXX2X41/JqMzWTXnprexCMEoa+MBBakgJA
 mJqAhTildhvwQh6ONYN4FP3WhxttGkjUHWY7Xu+u7WlZczUVgBYi8bvCnSY/S8Mse1mNY8LPv
 puRQqxl0IxfE7XqtBEAceszYAFtQZSXKfhpgpF+xGo0g++nMbBNSe7ECdBGJcPdnmat1CFMSo
 o/t/S6gzw3ZZDn7DDebqqYjiZKB9O1WGN5DMlPPXPkwHwiMvlpzw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlL9z-1pj2kM3gGz-00lm4Y; Sat, 10
 Jun 2023 13:36:39 +0200
Message-ID: <3a7476b6-2ae9-494e-1840-0915ddf47c2f@web.de>
Date: Sat, 10 Jun 2023 13:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Jyri Sarha <jyri.sarha@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr,
 Dan Carpenter <error27@gmail.com>
References: <20230322181830.574635-1-jyri.sarha@linux.intel.com>
Subject: [PATCH] ASoC: SOF: ipc4-topology: Improve unlocking of a mutex in
 sof_ipc4_widget_free()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230322181830.574635-1-jyri.sarha@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wH7mt4BmBOHl2bT+2stSVV504BUjp0cScJU4RPbli9haTm1LPjS
 yEjz82eswp9H9eqLP8TPErdJ3OsYof91tMhb1Hj2gGOefWbCT1l2HNMdNQ8IMMWScwjiBhl
 t+NCeoGXQIM2PixuSttZRtOx+YuR75LCIEdn5NU2mp45GBwHRD/efJtIKVDVo/x4v5dZPND
 GBDvwXBpw7oVLyFrx+y+A==
UI-OutboundReport: notjunk:1;M01:P0:swMfz+U+qwQ=;xPmNxZHmQ9wMqTfQ1A4Y+b68NUI
 B2D2xmQK6pq2x95GThKnWl091GVzVqFFxZqRR2v3JE67vLD+0qDjDY/kxvsHGPpz6bOVolrUI
 MwX3/9eeJ9quQrCo8F8UMwk/V5VEDfs2UScKfHK2UVL0d4cF2Bv7klPx2/m0nyWN8/e21E10C
 Ps7a1A9PtehSaSih1Omw8HNm+E06PXxEeAc0gQwekoX7bLeIeUDOU/ijFU+qvJ6yHHwbMg1wF
 OOQbAwIgFeh0/MO52V0Ey4SoDSDmzBxyA3VaR7mmwWF7sWtV31Skl8Pq3qVdTWZ6EZj0k1VKK
 hUlCCDY8I9OwTpmKu54uDW6xh0Sev1WnmWEAfTheTUNrrI0vhPebwjNvJul1Ai4OinQWU0AvE
 GdiFIw9TZ+AZ5v30e/7dC3vVx38FvqYpbGsXnzI/4/66PHsUe2XB2eI+r+py1SbVZFwBy7LHh
 LmTiwqUvsgzf3IvpfICmzvABcfoh/ME6fs2X/hKIGOsiTkJjJmAZ6hSRnMK8eCmIKFrf8LLJP
 bmOlaiHMBLEny9v/T9cRRuXbHnAu68Ip6WEzhvyeijrk8vmwEjwmwQX1XrKm4VpKwV39US/4C
 GiTc4+9AwNrN2qAxKUnSEAavh5lIXYeTQus34xJ2puJ6GItjwNinvY2SIMiyZanmOeoEnu2kU
 m5PU3wSDGGjzGYQaoc8Fl3VSn0Vhxa1wSNNsCm+GyE+g723CMQa9AD5oSbb9STnqxHKNCWJ0n
 t4WusowhqtTun5lQEYwwI/Bf10EzqtRGcuRpPRTCMWKIRZ14//91HZGQhfJvZ5/z4xBBIRDFN
 F8K02Rvx+DOgL74bsZKWCPYv0Ll+kTXgxFixmk2a3ch/GSmdXZtwSpbZAUeCvBg1MZqQ5giJC
 dJhJrOFYC+cQjM5RhlYSIbO5evaoCLiJc+aM8+EBrvbRBmGpVuvD5nvgXJ2Fn0EG8ebPodYXc
 bSpSZ9NHtx6mFymKz3eMAR87unc=
Message-ID-Hash: 5ZQ2RUXYSF2SZFOQZPEPSOAYWSQTGHEC
X-Message-ID-Hash: 5ZQ2RUXYSF2SZFOQZPEPSOAYWSQTGHEC
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZQ2RUXYSF2SZFOQZPEPSOAYWSQTGHEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Jun 2023 12:40:09 +0200

Add a jump target so that a call of the function =E2=80=9Cmutex_unlock=E2=
=80=9D
is stored only once in this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/soc/sof/ipc4-topology.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a4e1a70b607d..f0fd1dfa384e 100644
=2D-- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2300,8 +2300,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *=
sdev, struct snd_sof_widget
 		if (pipeline->use_chain_dma) {
 			dev_warn(sdev->dev, "use_chain_dma set for scheduler %s",
 				 swidget->widget->name);
-			mutex_unlock(&ipc4_data->pipeline_state_mutex);
-			return 0;
+			goto unlock;
 		}

 		header =3D SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->instance_id);
@@ -2326,7 +2325,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *=
sdev, struct snd_sof_widget
 		if (!pipeline->use_chain_dma)
 			ida_free(&fw_module->m_ida, swidget->instance_id);
 	}
-
+unlock:
 	mutex_unlock(&ipc4_data->pipeline_state_mutex);

 	return ret;
=2D-
2.41.0

