Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BE5F02A4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 17:26:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ACF016DB;
	Tue,  5 Nov 2019 17:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ACF016DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572971192;
	bh=ctBu3R3dVXAlR7P2x9hx8w/l8M40B8Jb9RXAQEdi1nY=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luZxX+OsCIGLLKIYzCqdpl28z/EuZrI/S3wv9wB4zvW2RK++0xFto1raSn1OFe5/Q
	 631AHbjCz8BGl184LAFNAFXGtgSOFmRKor9N44g7ocqR6cxCkSSmYCUm5aXnZMT3XI
	 DeVznQqg0u40ZY0L4OUGW/vTv9kkIVSJXhQzwTX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 290BEF80535;
	Tue,  5 Nov 2019 17:24:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5ADBF8049B; Tue,  5 Nov 2019 17:24:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FBD3F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 17:24:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FBD3F80271
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 08:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="227153833"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2019 08:24:37 -0800
Date: Tue, 5 Nov 2019 18:24:37 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157297038783.18566.4452216868127032897@skylake-alporthouse-com>
Message-ID: <alpine.DEB.2.21.1911051820400.16459@zeliteleevi>
References: <20191105161053.22958-1-kai.vehmanen@linux.intel.com>
 <157297038783.18566.4452216868127032897@skylake-alporthouse-com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 lakshminarayana.vudum@intel.com, jani.saarinen@intel.com
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: hdmi - add Tigerlake support
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

Hi,

On Tue, 5 Nov 2019, Chris Wilson wrote:

> Quoting Kai Vehmanen (2019-11-05 16:10:53)
> > Add Tigerlake HDMI codec support.
> > 
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205379
> > BugLink: https://bugs.freedesktop.org/show_bug.cgi?id=112171
> > Cc: Pan Xiuli <xiuli.pan@linux.intel.com>
> > Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> For thos watching,
> https://patchwork.freedesktop.org/series/68972/#rev1
> includes the revert so that this is tested. Not that the first run
> through BAT tgl died too early to be conclusive.

ack. The partial results do look good already. The boot log
shows HDMI codec found and configured without errors:
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_5274/fi-tgl-u/boot0.txt

And the S3 suspend test did pass:
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_5274/fi-tgl-u/igt@gem_exec_suspend@basic-s3.html

So so far so good.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
