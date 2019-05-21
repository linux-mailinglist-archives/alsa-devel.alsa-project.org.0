Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC9250F9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 15:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA5CC1661;
	Tue, 21 May 2019 15:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA5CC1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558446419;
	bh=Wn8xR67g40u+QipXGZaHgr7w67Mbnt8lPoKPiSnU05w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CDLYSyRK23kd3RCy4yuZAxLDvtL6u5SheFho3A8W/vagVfjBgnI6FCmAsBe1Y0aSg
	 YxtO9wXzdG3ApGeolJnMY58yJOEaFmOI0VQWDRVnPi83fNI0UXb2FbeJV8cl4ldgAV
	 wVWVBY5GqqpPR0fzccajXMy6JbTIhcB/dGS9e6m0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84771F806E7;
	Tue, 21 May 2019 15:45:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56B12F89717; Tue, 21 May 2019 15:42:55 +0200 (CEST)
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67DA7F806E7;
 Tue, 21 May 2019 15:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DA7F806E7
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id A87D33C00D1;
 Tue, 21 May 2019 15:32:34 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvRZgVAA6W68; Tue, 21 May 2019 15:32:27 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 652643C005E;
 Tue, 21 May 2019 15:32:27 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 21 May 2019 15:32:26 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Tue, 21 May 2019 15:32:26 +0200
Message-ID: <1558445546-11437-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH - alsa-lib 0/4] Add pcm_file input file support
	for MMAP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

implement overwriting read buffer with input file in case of
RW_NONINTERLEAVED and MMAP access modes for alsa file plugin

first two patches introduce a helper function for copying data from
input file to readi and readn buffers for user. to facilitate this
snd_pcm_areas_from_buf and snd_pcm_areas_from_bufs with
snd_pcm_areas_copy is used. Previous readi behaviour in corner
case of input file EOF is changed (more in patch comment).

Patch 3,4 introduce new api callback mmap_begin to ease overwritting
mmaped buffer in case of MMAP access.

Adam Miartus (4):
  pcm_file: add support for infile reading in non interleaved mode
  pcm_file: use snd_pcm_file_areas_read_infile for readi
  pcm: add mmap_begin callback to snd_pcm_fast_ops_t api
  pcm_file: add infile read support for mmap mode

 src/pcm/pcm.c           |   6 +++
 src/pcm/pcm_dmix.c      |   1 +
 src/pcm/pcm_dshare.c    |   1 +
 src/pcm/pcm_dsnoop.c    |   1 +
 src/pcm/pcm_file.c      | 125 ++++++++++++++++++++++++++++++++++++++----------
 src/pcm/pcm_generic.h   |   1 -
 src/pcm/pcm_hooks.c     |   1 +
 src/pcm/pcm_hw.c        |   2 +
 src/pcm/pcm_ioplug.c    |   1 +
 src/pcm/pcm_local.h     |   1 +
 src/pcm/pcm_meter.c     |   1 +
 src/pcm/pcm_mmap_emul.c |   1 +
 src/pcm/pcm_multi.c     |   1 +
 src/pcm/pcm_null.c      |   1 +
 src/pcm/pcm_plugin.c    |   1 +
 src/pcm/pcm_rate.c      |   1 +
 src/pcm/pcm_share.c     |   1 +
 src/pcm/pcm_shm.c       |   1 +
 18 files changed, 122 insertions(+), 26 deletions(-)

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
