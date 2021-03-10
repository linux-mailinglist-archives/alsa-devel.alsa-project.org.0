Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D2333C76
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 13:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E28341764;
	Wed, 10 Mar 2021 13:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E28341764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615378719;
	bh=FN2QLVDVQYPh2Dmoyd0/I+hLCmcKpCzdcPKDgLG47RA=;
	h=Subject:To:From:Date:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Q5FptW1F3Y1ZfnP3Z9TRBpgCYNpxL9o8vlOWjYAf/6JP61RwRxwTzR9Q4qAV4Gdqz
	 DoYeBTK0bRNcE09hCdwHJcDbxRSMtIfdX/+lPgf4E/qkeaR1hrGgYDg4Og6kW9SOjv
	 wwHXClV1UdiQwP0m0DiL/r81not0StuaQ0HMfK7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51AC9F8010D;
	Wed, 10 Mar 2021 13:17:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ED60F801D8; Wed, 10 Mar 2021 13:17:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51529F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 13:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51529F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="yEGjHSFD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53DB564FDD;
 Wed, 10 Mar 2021 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615378612;
 bh=FN2QLVDVQYPh2Dmoyd0/I+hLCmcKpCzdcPKDgLG47RA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=yEGjHSFDthIv7zvUT80TwHi5tWD47QaS4MusE0TZ6ujX7GzV8IwPRTlurBVBPrU/v
 1uII3omoQcfi+QpiS9vHibhLczixORfklTVEJCO+KVwOmif/xV/5zYGR1upixYrFvB
 8i9HuoZBQkyHfn+nQboqFhxM72bNpOGMjQYrlmEM=
Subject: Patch "[PATCH v2] ASoC: SOF: Intel: broadwell: fix mutual exclusion
 with catpt driver" has been added to the 5.10-stable tree
To: alsa-devel@alsa-project.org, broonie@kernel.org, cezary.rojewski@intel.com,
 david.ward@ll.mit.edu, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, sashal@kernel.org, tiwai@suse.de
From: <gregkh@linuxfoundation.org>
Date: Wed, 10 Mar 2021 13:16:41 +0100
In-Reply-To: <20210309221618.246754-1-pierre-louis.bossart@linux.intel.com>
Message-ID: <16153786011636@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
Cc: stable-commits@vger.kernel.org
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


This is a note to let you know that I've just added the patch titled

    [PATCH v2] ASoC: SOF: Intel: broadwell: fix mutual exclusion with catpt driver

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     asoc-sof-intel-broadwell-fix-mutual-exclusion-with-catpt-driver.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From pierre-louis.bossart@linux.intel.com  Wed Mar 10 13:06:02 2021
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue,  9 Mar 2021 16:16:18 -0600
Subject: [PATCH v2] ASoC: SOF: Intel: broadwell: fix mutual exclusion with catpt driver
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, David Ward <david.ward@ll.mit.edu>, Cezary Rojewski <cezary.rojewski@intel.com>, stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Message-ID: <20210309221618.246754-1-pierre-louis.bossart@linux.intel.com>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

In v5.10, the "haswell" driver was replaced by the "catpt" driver, but
the mutual exclusion with the SOF driver was not updated. This leads
to errors with card names and UCM profiles not being loaded by
PulseAudio.

This fix should only be applied on v5.10-stable, the mutual exclusion
was removed in 5.11.

Reported-by: David Ward <david.ward@ll.mit.edu>
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=211985
Fixes: 6cbfa11d2694 ("ASoC: Intel: Select catpt and deprecate haswell")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org>
Cc: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/sof/intel/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -84,7 +84,7 @@ config SND_SOC_SOF_BAYTRAIL
 
 config SND_SOC_SOF_BROADWELL_SUPPORT
 	bool "SOF support for Broadwell"
-	depends on SND_SOC_INTEL_HASWELL=n
+	depends on SND_SOC_INTEL_CATPT=n
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Broadwell processors.


Patches currently in stable-queue which might be from pierre-louis.bossart@linux.intel.com are

queue-5.10/asoc-sof-intel-broadwell-fix-mutual-exclusion-with-catpt-driver.patch
