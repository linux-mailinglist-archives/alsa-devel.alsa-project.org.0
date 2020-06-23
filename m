Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4AA205E51
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 22:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8413917D1;
	Tue, 23 Jun 2020 22:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8413917D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592944018;
	bh=oas93NNC0F914MjXfIOoxIh9b9rSyP2udPEEJm45pOg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQ206/9qjkvTfGMYcDUuTtDDGEBFHnz9zLvm2r9XL3CE0C0uvO9gUZfJ8/XZaT3qf
	 79ll6s7xRceN6xjGX3Etg2S+s9C5nYV3kyio1AAZe/TPjj3IZPNP85wkOkb+8YT51H
	 A2wUCUzmTv/bTTxvuXYmM6U2ox0CrRcwMjS9BWRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E22F8010E;
	Tue, 23 Jun 2020 22:25:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EE2CF80234; Tue, 23 Jun 2020 22:25:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26B70F8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 22:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B70F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VwOqVH7N"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16E93206C3;
 Tue, 23 Jun 2020 20:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592943904;
 bh=oas93NNC0F914MjXfIOoxIh9b9rSyP2udPEEJm45pOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VwOqVH7Noghf1uXnjCBH3WeR4jQb53GUvXx2g/d6vTP2b0to5LpIZPU8puoBVI1gZ
 kCD67OZcoatsJTZYOPtr49hwxlhX8NeF1y9e6GJNUuCnUTBquv9DXUx5OS77KC/z7N
 LHszjp62V2bySRvt75Gqkzmr5t4O9aGml6VcnXXE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 066/314] ASoC: qcom: q6asm-dai: kCFI fix
Date: Tue, 23 Jun 2020 21:54:21 +0200
Message-Id: <20200623195341.985207079@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623195338.770401005@linuxfoundation.org>
References: <20200623195338.770401005@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Alistair Delva <adelva@google.com>, Amit Pundir <amit.pundir@linaro.org>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sami Tolvanen <samitolvanen@google.com>, John Stultz <john.stultz@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Todd Kjos <tkjos@google.com>
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

From: John Stultz <john.stultz@linaro.org>

[ Upstream commit a6b675a89e51a1cdad0481b809b7840d3f86e4b5 ]

Fixes the following kCFI crash seen on db845c, caused
by the function prototypes not matching the callback
function prototype.

[   82.585661] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000001
[   82.595387] Mem abort info:
[   82.599463]   ESR = 0x96000005
[   82.602658]   EC = 0x25: DABT (current EL), IL = 32 bits
[   82.608177]   SET = 0, FnV = 0
[   82.611829]   EA = 0, S1PTW = 0
[   82.615369] Data abort info:
[   82.618751]   ISV = 0, ISS = 0x00000005
[   82.622641]   CM = 0, WnR = 0
[   82.625774] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000174259000
[   82.632292] [0000000000000001] pgd=0000000000000000, pud=0000000000000000
[   82.639167] Internal error: Oops: 96000005 [#1] PREEMPT SMP
[   82.644795] Modules linked in: hci_uart btqca xhci_plat_hcd xhci_pci_renesas xhci_pci xhci_hcd wcn36xx wcnss_ctrl wcd934x vctrl_regulator ufs_qcom syscon_reboot_e
[   82.644927]  qcom_apcs_ipc_mailbox q6asm_dai q6routing q6asm q6afe_dai q6adm q6afe q6core q6dsp_common pm8941_pwrkey pm8916_wdt platform_mhu pinctrl_spmi_mpp pine
[   82.812982] CPU: 3 PID: 240 Comm: kworker/u16:4 Tainted: G        W         5.6.0-rc7-mainline-00960-g0c34353d11b9-dirty #1
[   82.824201] Hardware name: Thundercomm Dragonboard 845c (DT)
[   82.829937] Workqueue: qcom_apr_rx apr_rxwq [apr]
[   82.834698] pstate: 80c00005 (Nzcv daif +PAN +UAO)
[   82.839553] pc : __cfi_check_fail+0x4/0x1c [q6asm_dai]
[   82.844754] lr : __cfi_check+0x3a8/0x3b0 [q6asm_dai]
[   82.849767] sp : ffffffc0105f3c20
[   82.853123] x29: ffffffc0105f3c30 x28: 0000000000000020
[   82.858489] x27: ffffff80f4588400 x26: ffffff80f458ec94
[   82.863854] x25: ffffff80f458ece8 x24: ffffffe3670c7000
[   82.869220] x23: ffffff8094bb7b34 x22: ffffffe367137000
[   82.874585] x21: bd07909b332eada6 x20: 0000000000000001
[   82.879950] x19: ffffffe36713863c x18: ffffff80f8df4430
[   82.885316] x17: 0000000000000001 x16: ffffffe39d15e660
[   82.890681] x15: 0000000000000001 x14: 0000000000000027
[   82.896047] x13: 0000000000000000 x12: ffffffe39e6465a0
[   82.901413] x11: 0000000000000051 x10: 000000000000ffff
[   82.906779] x9 : 000ffffffe366c19 x8 : c3c5f18762d1ceef
[   82.912145] x7 : 0000000000000000 x6 : ffffffc010877698
[   82.917511] x5 : ffffffc0105f3c00 x4 : 0000000000000000
[   82.922877] x3 : 0000000000000000 x2 : 0000000000000001
[   82.928243] x1 : ffffffe36713863c x0 : 0000000000000001
[   82.933610] Call trace:
[   82.936099]  __cfi_check_fail+0x4/0x1c [q6asm_dai]
[   82.940955]  q6asm_srvc_callback+0x22c/0x618 [q6asm]
[   82.945973]  apr_rxwq+0x1a8/0x27c [apr]
[   82.949861]  process_one_work+0x2e8/0x54c
[   82.953919]  worker_thread+0x27c/0x4d4
[   82.957715]  kthread+0x144/0x154
[   82.960985]  ret_from_fork+0x10/0x18
[   82.964603] Code: a8c37bfd f85f8e5e d65f03c0 b40000a0 (39400008)
[   82.970762] ---[ end trace 410accb839617143 ]---
[   82.975429] Kernel panic - not syncing: Fatal exception

Signed-off-by: John Stultz <john.stultz@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Patrick Lai <plai@codeaurora.org>
Cc: Banajit Goswami <bgoswami@codeaurora.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Alistair Delva <adelva@google.com>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: alsa-devel@alsa-project.org
Link: https://lore.kernel.org/r/20200529213823.98812-1-john.stultz@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 548eb4fa2da64..9f0ffdcef637e 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -171,7 +171,7 @@ static const struct snd_compr_codec_caps q6asm_compr_caps = {
 };
 
 static void event_handler(uint32_t opcode, uint32_t token,
-			  uint32_t *payload, void *priv)
+			  void *payload, void *priv)
 {
 	struct q6asm_dai_rtd *prtd = priv;
 	struct snd_pcm_substream *substream = prtd->substream;
@@ -494,7 +494,7 @@ static struct snd_pcm_ops q6asm_dai_ops = {
 };
 
 static void compress_event_handler(uint32_t opcode, uint32_t token,
-				   uint32_t *payload, void *priv)
+				   void *payload, void *priv)
 {
 	struct q6asm_dai_rtd *prtd = priv;
 	struct snd_compr_stream *substream = prtd->cstream;
-- 
2.25.1



