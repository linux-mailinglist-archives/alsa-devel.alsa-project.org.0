Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CF854ED54
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:30:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED2251B08;
	Fri, 17 Jun 2022 00:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED2251B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655418632;
	bh=7UbYtxg7UlZuIW9ZfzC+gdYmHW308a8EmsIM6qjPT7s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dX+uXvmmNbSzAr+9Wci3ulQ3d9tztKIr84euThexvgCmJDz+a2rlhilXGApDjqsuO
	 t8SIAcLbS5tPHN654zEPPoUIFuZZOGbW060hcoEzwJkNVzlvwbnSFSq3v/4eD00n6P
	 gNDLeIQp7o4mwSigH7LNHStuEiuSJUUTH5FeNW2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56286F8047C;
	Fri, 17 Jun 2022 00:29:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42791F8012A; Fri, 17 Jun 2022 00:29:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC525F8012A
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC525F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eNtFeWL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655418566; x=1686954566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7UbYtxg7UlZuIW9ZfzC+gdYmHW308a8EmsIM6qjPT7s=;
 b=eNtFeWL1Xp6lDmTq5DZNyEnZfQBdi6VcqczCq4kOae5xr2jYixNG2Q4W
 87KTj6QqLovYK8QpEtIVF+t73Ysy0aFYwjW3Jw1DpzZ8Qdi+My5eq7k1f
 tktIG7YH6wvNwbd6jaorW+l5DFbXbNdesI3oCJEC1vc0AgoVJpL7SCnxI
 hIuNKVXW2cdFxAvNugfVy4ETGxDeP7hYUbh+6Be/p5SJGDBtb1YxueGxw
 Gqslveupmi29r2dWXCGb1p9VR+Y5BQH8uGmbMqSqXzlEZwXZ3tfy/Hss9
 +dJ3DZnQzSsBNSD+v85us0mlXw90H6+kB7xmIhfywrQxmk1DfA8zgLne+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="365718818"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="365718818"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:29:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="653359636"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:29:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: x86: intel_hdmi_audio: pm_runtime updates
Date: Thu, 16 Jun 2022 17:29:08 -0500
Message-Id: <20220616222910.136854-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

While cleaning up the code to use pm_runtime_resume_and_get(), I
realized we never called pm_runtime_enable() for this driver. This is
potentially very invasive and error-prone, so feedback and test
results are welcome - all my BYT/CHT devices are not longer functional
unfortunately, and our CI MinnowBoard uses the 'other' HDMI solution
based on HDaudio.

In addition, the resume was assumed to be always successful, which
isn't a very good idea.

Pierre-Louis Bossart (2):
  ALSA: x86: intel_hdmi_audio: enable pm_runtime and set autosuspend
    delay
  ALSA: x86: intel_hdmi_audio: use pm_runtime_resume_and_get()

 sound/x86/intel_hdmi_audio.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

-- 
2.34.1

