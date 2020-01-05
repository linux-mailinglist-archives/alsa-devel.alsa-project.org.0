Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8F13088A
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:06:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FB417DD;
	Sun,  5 Jan 2020 16:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FB417DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236794;
	bh=Yb3q+vrqYNM4FjHRaRrSCxG+kf9snZMQc0DGw3rRBZI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ow9f6OT4iXUtffh9kz6xFP36BJToAFe89B/7B08ZtIHFqLWw8gozm2RRdvAjjWf3G
	 6ZN4HFx4m8s0hajmDzGFRii08v5dze947m4qiNlkwNRJx0mXnlL+tcs4DPFtDI4LZZ
	 dkjT776sBnHoxptexByeqKaJ73VrOcRMUnvbaP3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C95FF803CE;
	Sun,  5 Jan 2020 15:49:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A2DF8028A; Sun,  5 Jan 2020 15:49:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E688F8028B
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E688F8028B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CE7BCB23D
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:38 +0100
Message-Id: <20200105144823.29547-24-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 23/68] ALSA: pcxhr: More constifications
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Apply const prefix to each possible place: the board parameters and
DSP command table, and the string arrays.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/pcxhr/pcxhr.c       | 2 +-
 sound/pci/pcxhr/pcxhr_core.c  | 6 +++---
 sound/pci/pcxhr/pcxhr_hwdep.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index 9e59d591217b..c2e4831c3a13 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -136,7 +136,7 @@ struct board_parameters {
 	short fw_file_set;
 	short firmware_num;
 };
-static struct board_parameters pcxhr_board_params[] = {
+static const struct board_parameters pcxhr_board_params[] = {
 [PCI_ID_VX882HR] =      { "VX882HR",      4, 4, 0, 41 },
 [PCI_ID_PCX882HR] =     { "PCX882HR",     4, 4, 0, 41 },
 [PCI_ID_VX881HR] =      { "VX881HR",      4, 4, 0, 41 },
diff --git a/sound/pci/pcxhr/pcxhr_core.c b/sound/pci/pcxhr/pcxhr_core.c
index 495be27e3ba2..87d24224c042 100644
--- a/sound/pci/pcxhr/pcxhr_core.c
+++ b/sound/pci/pcxhr/pcxhr_core.c
@@ -466,7 +466,7 @@ enum {
 /*
  * Array of DSP commands
  */
-static struct pcxhr_cmd_info pcxhr_dsp_cmds[] = {
+static const struct pcxhr_cmd_info pcxhr_dsp_cmds[] = {
 [CMD_VERSION] =				{ 0x010000, 1, RMH_SSIZE_FIXED },
 [CMD_SUPPORTED] =			{ 0x020000, 4, RMH_SSIZE_FIXED },
 [CMD_TEST_IT] =				{ 0x040000, 1, RMH_SSIZE_FIXED },
@@ -497,7 +497,7 @@ static struct pcxhr_cmd_info pcxhr_dsp_cmds[] = {
 };
 
 #ifdef CONFIG_SND_DEBUG_VERBOSE
-static char* cmd_names[] = {
+static const char * const cmd_names[] = {
 [CMD_VERSION] =				"CMD_VERSION",
 [CMD_SUPPORTED] =			"CMD_SUPPORTED",
 [CMD_TEST_IT] =				"CMD_TEST_IT",
@@ -1006,7 +1006,7 @@ static int pcxhr_handle_async_err(struct pcxhr_mgr *mgr, u32 err,
 				  enum pcxhr_async_err_src err_src, int pipe,
 				  int is_capture)
 {
-	static char* err_src_name[] = {
+	static const char * const err_src_name[] = {
 		[PCXHR_ERR_PIPE]	= "Pipe",
 		[PCXHR_ERR_STREAM]	= "Stream",
 		[PCXHR_ERR_AUDIO]	= "Audio"
diff --git a/sound/pci/pcxhr/pcxhr_hwdep.c b/sound/pci/pcxhr/pcxhr_hwdep.c
index 12a6bdb920b2..2258bd698844 100644
--- a/sound/pci/pcxhr/pcxhr_hwdep.c
+++ b/sound/pci/pcxhr/pcxhr_hwdep.c
@@ -348,7 +348,7 @@ static int pcxhr_dsp_load(struct pcxhr_mgr *mgr, int index,
  */
 int pcxhr_setup_firmware(struct pcxhr_mgr *mgr)
 {
-	static char *fw_files[][5] = {
+	static const char * const fw_files[][5] = {
 	[0] = { "xlxint.dat", "xlxc882hr.dat",
 		"dspe882.e56", "dspb882hr.b56", "dspd882.d56" },
 	[1] = { "xlxint.dat", "xlxc882e.dat",
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
