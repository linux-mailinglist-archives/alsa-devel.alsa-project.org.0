Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8E8EE2B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 16:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7EB51657;
	Thu, 15 Aug 2019 16:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7EB51657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565879401;
	bh=VVLJ3gaovK35w2Qh3BKDgphFRyfbhVCBgcIZ2c+nacI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oNlg41mHH9UltEwGg/FLm8dQczu3GllvUTIUgYC7kkSqlLxJygOETnuitULoaHpQY
	 HdFRWmPiQTqIeE34fuK3r9TL5krzUG6uoFyu+f0a6yp5rpelr34DxBI4KJy8M7T5Vj
	 9baf143isszVxJyi7HYLjkvp8MuxE0a638+6gPso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BF98F8011F;
	Thu, 15 Aug 2019 16:28:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDF82F80274; Thu, 15 Aug 2019 16:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=HDRS_LCASE,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B54C5F8011F
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 16:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B54C5F8011F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 07:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="188505655"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga002.jf.intel.com with ESMTP; 15 Aug 2019 07:28:03 -0700
Date: Thu, 15 Aug 2019 17:28:02 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1908151641110.16459@zeliteleevi>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] sof/hda rework to share more of patch_hdmi.c logic
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

Hi Takashi,

I notice you are doing a lot of cleanups to HDA code. Just FYI I'm looking 
into modifying the SOF Intel backend to use 
snd-hda-codec-hdmi/patch_hdmi.c for HDMI/DP audio support, i.e. to be able 
to share this code between snd-hda-intel and SOF Intel (and not using 
hdac-hdmi).

Let me know if this clashes with something you are already looking into. I 
have a very rough version up and running, but it still needs some work. If 
the general idea seems ok to you, I'll continue to work on a RFC patch and 
send for review.

This will change how HDMI is exposed to user-space with SOF Intel drivers, 
so we need to be extra careful how this is introduced. But this really 
seems to be the best way to go to avoid the duplicated maintenance work 
with two drivers that we now have.

PS Tracked in SOF github as 
   https://github.com/thesofproject/linux/issues/1123

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
