Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A16425B3C53
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 17:46:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FCE61697;
	Fri,  9 Sep 2022 17:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FCE61697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662738399;
	bh=TNZ6Tp6AT9E+t804PZOIzJt6ZOTK/oqvgxU3rikq3B8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W3ghMXniqvyT/PY24Ph1HUX5fs0zTtp9avRVT9j+Fq5ul0AIk76tQg85ScVEeReA9
	 o6Foc95q2tX2omtM3+anCjIrsItLCgz9sA+1PVS8lyd6+Pu1Zq+ScdKsw0+qzPRlev
	 Zf7u4ADm5krz+EtpPPFr/BbPtSvO6hFLXsPSmUVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B91FAF8016D;
	Fri,  9 Sep 2022 17:45:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6F12F8032B; Fri,  9 Sep 2022 17:45:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4EE0F8016D
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 17:45:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4EE0F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KZkxX5/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662738332; x=1694274332;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=TNZ6Tp6AT9E+t804PZOIzJt6ZOTK/oqvgxU3rikq3B8=;
 b=KZkxX5/YgiqzmPBvNvaRvprv0qL6yk0wMVyFmxn6VZy+5NfbDvQDfB9z
 BuHrMB0p0BjmO+WSlLos7dauP8Qm2j2DOOyr4oFSEsAdVsRurdqJLO3SP
 vBCLXaz590/FtA2lQT3h/5MSGFJXn/k0Viyt+nHLtyRsAP8GDXCLGfnmD
 Ll+hRPi16nK7SbBv4ZGWdMLeG/UAaL/OowSsudg4d61lS4tfGLchkPuoL
 59mUusd6SdXwYA81tGStgrUhp8txh99qM22KCxvqpErlP6or4+8PYa/Ge
 29FSbqhDGhfzw8RB4HkYZ0ufeRYxkYJFJ7umSfaAtpSURc7sdk8vm7Yxi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="297501167"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="297501167"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 08:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="648479000"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 09 Sep 2022 08:45:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Sep 2022 18:45:25 +0300
Date: Fri, 9 Sep 2022 18:45:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: hda codec unbind refcount hang
Message-ID: <YxtflWQnslMHVlU7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Patchwork-Hint: comment
Cc: alsa-devel@alsa-project.org
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

Hi Takashi,

commit 7206998f578d ("ALSA: hda: Fix potential deadlock at codec
unbinding") introduced a problem on at least one of my older machines.

The problem happens when hda_codec_driver_remove() encounters a
codec without any pcms (and thus the refcount is 1) and tries to
call refcount_dec(). Turns out refcount_dec() doesn't like to be
used for dropping the refcount to 0, and instead if spews a warning
and does its saturate thing. The subsequent wait_event() is then
permanently stuck waiting on the saturated refcount.

I've definitely seen the same kind of pattern used elsewhere
in the kernel as well, so the fact that refcount_t can't be used
to implement it is a bit of surprise to me. I guess most other
places still use atomic_t instead.

-- 
Ville Syrjälä
Intel
