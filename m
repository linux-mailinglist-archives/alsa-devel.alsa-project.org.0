Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA24E44BB
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 18:09:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 723D8174C;
	Tue, 22 Mar 2022 18:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 723D8174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647968939;
	bh=IKpM7qg91zAeSWZxjjxBLZb/gPrKjvIyj1rQbrDTjGQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DboEQ14MuDlm6pXAnTX3oaNJuuRIBADMOgIZtbqAYLyRvG0pNDeWBq1he8XD6YKei
	 IolLK+iyv2z0S4VNzgKdNRk91IJcpP45ZxyAyPUTSoANfLPhrFfYNugu0tmZ6WPm8M
	 cAachHFIrrJIGP2Rdk530DJuz/9a43C4EUzLSkK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC943F80116;
	Tue, 22 Mar 2022 18:07:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74792F8047D; Tue, 22 Mar 2022 18:07:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A57DF80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 18:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A57DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="yXztFw54"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="GNNkuVEr"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 16F531F387;
 Tue, 22 Mar 2022 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647968867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m0HZkkkCvfCXgsfLMiVZKxjN0kToTbJd7hKDVBIs6aw=;
 b=yXztFw54QWyEjaLgsgPWhqqOKkFrluWU7938ub+Z2d1duXcO0guuhmxi7f54qsEy6ozkC5
 ZuiOesYv/NlU1VLuwtG2uZZ8162OaN7k1uOl+xVdZoLjN+YRwAZ6xYZQ2SAXHcfh8BIJqq
 Rx+H7ia0S2/KRivAdzVe2IEMvxdxaGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647968867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m0HZkkkCvfCXgsfLMiVZKxjN0kToTbJd7hKDVBIs6aw=;
 b=GNNkuVErgDbvoXDAHyunnpH0GP9D4G6s997TI+dN8OtjcWuqoLEY/0GCvrCk/2GwL1Eymx
 N3JuCQ41MdjXX3Aw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 0EF0EA3B87;
 Tue, 22 Mar 2022 17:07:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ALSA: pcm: Fix ioctl races
Date: Tue, 22 Mar 2022 18:07:16 +0100
Message-Id: <20220322170720.3529-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hu Jiahui <kirin.say@gmail.com>, linux-kernel@vger.kernel.org
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

Hi,

this is a patch set to address the recently reported bug for the racy
PCM ioctls.  In short, the current ALSA PCM core doesn't take enough
care of concurrent ioctl calls, and the concurrent calls may result in
a use-after-free.  The reported problem was the concurrent hw_free
calls, but there can be similar cases with other code paths like
hw_params, prepare, etc, too.

The patch set introduces the new runtime->buffer_mutex for protecting
those.  The first patch is the fix for the reported issue (the races
with hw_free), while the rest three are more hardening for the other
similar executions.

[ Note that the patch 3 was slightly modified from the version I sent
  to distros list, as I noticed possible lockdep (false-positive)
  warnings.  The behavior is almost same, just written differently. ]


thanks,

Takashi

===

Takashi Iwai (4):
  ALSA: pcm: Fix races among concurrent hw_params and hw_free calls
  ALSA: pcm: Fix races among concurrent read/write and buffer changes
  ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free
    calls
  ALSA: pcm: Fix races among concurrent prealloc proc writes

 include/sound/pcm.h     |  1 +
 sound/core/pcm.c        |  2 +
 sound/core/pcm_lib.c    |  4 ++
 sound/core/pcm_memory.c | 11 +++--
 sound/core/pcm_native.c | 93 +++++++++++++++++++++++++----------------
 5 files changed, 71 insertions(+), 40 deletions(-)

-- 
2.31.1

