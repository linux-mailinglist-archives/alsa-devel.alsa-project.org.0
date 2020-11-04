Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 812032A5CBC
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 03:31:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5771695;
	Wed,  4 Nov 2020 03:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5771695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604457071;
	bh=0TGsgzqZ4J3f4fxWBoNMRVswn7iVaLtnT/iqQ9QAsIc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G1xkgy93tVS0e1ZeVLoBbYuegeR7N1GI+doAxRrNCFtflpa1iOxN3Wpkib+PYhJT6
	 c9H05ZgIFO1T0o9IL3jXqR/CRjhrGd2z4ZTqhBQ2Tz06SayBMnNOp4+hYC774AV1Ix
	 3SZ0Xddc6+1c06EJfK6UfsArCyVHpgGjAoZAAgGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 677DEF80256;
	Wed,  4 Nov 2020 03:30:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10DE1F80247; Wed,  4 Nov 2020 03:30:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.7 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_141,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED,URI_TRY_3LD
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E171CF80234
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 03:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E171CF80234
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1604457010814182043-webhooks-bot@alsa-project.org>
References: <1604457010814182043-webhooks-bot@alsa-project.org>
Subject: (Regression) Broken pipe when streaming music from bandcamp with mpv
Message-Id: <20201104023018.10DE1F80247@alsa1.perex.cz>
Date: Wed,  4 Nov 2020 03:30:18 +0100 (CET)
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

alsa-project/alsa-lib issue #96 was edited from orbea:

OS: `Slackware64-current`
alsa-lib: `1.2.4`
mpv: https://github.com/mpv-player/mpv/commit/172146e9f7a231b5de21921d883612d18b13a717
yt-dlc: `2020.10.31` (https://github.com/blackjack4494/yt-dlc - bandcamp support is broken with youtube-dl currently)

When streaming music from bandcamp.com with alsa it will fail with a broken pipe when automatically changing tracks at the end of a track. This will not happen if the track is skipped.
```
$ mpv https://actnoir1.bandcamp.com/album/shape-a-new-start 

Playing: https://actnoir1.bandcamp.com/track/shatterproof-beauty
 (+) Audio --aid=1 (mp3 2ch 44100Hz)
AO: [alsa] 44100Hz stereo 2ch float
A: 00:05:20 / 00:05:21 (100%) Cache: 0.0s

Playing: https://actnoir1.bandcamp.com/track/set-fire
A: 00:05:20 / 00:05:21 (100%) Cache: 0.0s
[ao/alsa] snd_pcm_status: Broken pipe
A: 00:05:20 / 00:05:21 (100%) Cache: 0.0s
 (+) Audio --aid=1 (mp3 2ch 44100Hz)
[ao/alsa] snd_pcm_status: Broken pipe
[ao/alsa] snd_pcm_status: Broken pipe
[ao/alsa] snd_pcm_status: Broken pipe
mpv: ../audio/out/buffer.c:585: _Bool ao_play_data(struct ao *): Assertion `space >= 0' failed.
The process was killed by SIGABRT: Aborted
```
mpv log: [mpv.log](https://github.com/alsa-project/alsa-lib/files/5485135/mpv.log)
alsa-info log: [alsa-info.log](https://github.com/alsa-project/alsa-lib/files/5485141/alsa-info.log)

I bisected this and found the first bad commit.
```
$ git bisect good
4f90392f07e8822d1984ed990f622ad36022a4a3 is the first bad commit
commit 4f90392f07e8822d1984ed990f622ad36022a4a3
Author: Jaroslav Kysela <perex@perex.cz>
Date:   Fri Oct 9 19:57:57 2020 +0200

    pcm: fix the snd_pcm_plugin_status() avail and delay fields
    
    The avail and delay fields in the returned status structure does not
    reflect the actual hw_ptr/appl_ptr. This change correct this.
    
    TODO: Unfortunately, the delay might contain also information about
    extra hardware / buffering delay which is hidden with this change.
    
    Link: https://lore.kernel.org/alsa-devel/d9c1f37e-5c8d-f289-270e-c6cda7a56ce3@axis.com/
    Reported-by: Jonas Holmberg <jonashg@axis.com>
    Tested-by: Jonas Holmberg <jonashg@axis.com>
    Signed-off-by: Jaroslav Kysela <perex@perex.cz>

 src/pcm/pcm_plugin.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
```
4f90392f07e8822d1984ed990f622ad36022a4a3

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/96
Repository URL: https://github.com/alsa-project/alsa-lib
