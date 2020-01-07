Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A981133BA9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 07:23:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2E17183F;
	Wed,  8 Jan 2020 07:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2E17183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578464634;
	bh=ByfqdCllQDlHmlg5UkLuvbLGMY+3E1GfRLG6HruaGxs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H6ItqU2M/x2gKS3XHmqvG9U0ppTf8Sp0AtWiWsEGNK5ru8C+pejcWkXXhUQBLLaX+
	 IZ7MBKNznCWB+3Xc+5SGPwMOnikJ07Lvku4vMqEQPOd35V3U89Joj4OLnxPTeFxMx0
	 jXKgzS2Oji3dhOf0PvVe+4AmuD+71+YKhhtzAlOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF30F801DA;
	Wed,  8 Jan 2020 07:22:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E882F8014A; Tue,  7 Jan 2020 18:27:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89EFAF8010D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 18:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89EFAF8010D
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 09:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; d="scan'208";a="233275478"
Received: from ndcioban-mobl.jf.intel.com (HELO linux.intel.com)
 ([10.7.199.51])
 by orsmga002.jf.intel.com with SMTP; 07 Jan 2020 09:27:27 -0800
Received: by linux.intel.com (sSMTP sendmail emulation);
 Tue, 07 Jan 2020 09:24:57 -0800
Date: Tue, 7 Jan 2020 09:24:57 -0800
From: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>
To: Lucien_Kao@compal.com
Message-ID: <20200107172457.GA18938@nc-hades.jf.intel.com>
References: <d7aba6970fbd48f2b32e2bc6d838ab20@TPEMBX01.compal.com>
 <s5hwoa8j3xi.wl-tiwai@suse.de>
 <5aff22f1e36e484fa52e17c855e8ddc8@TPEMBX03.compal.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5aff22f1e36e484fa52e17c855e8ddc8@TPEMBX03.compal.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 08 Jan 2020 07:22:26 +0100
Cc: AJ_Cheng@compal.com, alsa-devel@alsa-project.org, CindyXT_Wang@compal.com,
 tiwai@suse.de, intel-gfx@lists.freedesktop.org, Nelson_Ye@compal.com,
 Shane_Yap@compal.com, Evan_Tseng@compal.com
Subject: Re: [alsa-devel] USB Type-C monitor flashes once when play a video
 file after unplug and re-plug the monitor
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

On Mon, Jan 06, 2020 at 08:08:04AM +0000, Lucien_Kao@compal.com wrote:
> Hi Takashi
> 
> We verified on Ubuntu 19.10 with kernel 5.4.0.0-050400-generic (please refer to attachment), the result is positive which symptom doesn't happen anymore once I played music or video sound output through Dell S2718D Type-C monitor. It seems had some fix in latest kernel.

Takashi, can you point to the patch series you suspect may have fixed this issue? 

Thanks,
Nathan
> 
> Thanks.
> 
> 
> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de> 
> Sent: Friday, January 3, 2020 5:16 PM
> To: Cheng. AJ (TPE) <AJ_Cheng@compal.com>
> Cc: intel-gfx@lists.freedesktop.org; alsa-devel@alsa-project.org; nathan.d.ciobanu@linux.intel.com; Wang. CindyXT (TPE) <CindyXT_Wang@compal.com>; Ye. Nelson (TPE) <Nelson_Ye@compal.com>; Yap. Shane (TPE) <Shane_Yap@compal.com>; Kao. Lucien (TPE) <Lucien_Kao@compal.com>; Tseng. Evan (TPE) <Evan_Tseng@compal.com>
> Subject: Re: [alsa-devel] USB Type-C monitor flashes once when play a video file after unplug and re-plug the monitor
> 
> On Fri, 03 Jan 2020 02:57:03 +0100,
> <AJ_Cheng@compal.com> wrote:
> > 
> > Hi Sirs,
> >         Here is chromebook SW team from Compal.
> > As the mail title, we hit issue that the external monitor will flash once when play video after hot pluging.
> > We can reproduce not only on chromebook but also ubuntu 16.04.
> > There has higher failure rate with Dell Solomon dock and Dell S2718D monitor.
> > 
> > We found adding the delay in "sound/pci/hda/patch_hdmi.c " can fix 
> > this issue.(as the attachment) May need your help to review and advice. Thanks.
> > 
> > Here is the issue number in gitlab for more detail.
> > https://gitlab.freedesktop.org/drm/intel/issues/318
> 
> Could you check whether it still happens with the latest upstream kernel, at least 5.4.y, if it wasn't tested yet?
> 
> I don't want to put a long delay just because of random reason unless it's really mandatory.  I'm wondering whether the recent write-sync change improves the situation, so let's check the recent code.
> 
> 
> thanks,
> 
> Takashi
> 
> > 
> > 
> > 
> > AJ Cheng
> > NID/NID1
> > e-mail: AJ_Cheng@compal.com<mailto:AJ_Cheng@compal.com>
> > Tel:  +886-2-8797-8599 ext. 17561
> > Mobile : +886-932827829
> > COMPAL Electronics, Inc.
> > 
> > [2 flash_once.diff <application/octet-stream (base64)>]
> > 
> > _______________________________________________
> > Alsa-devel mailing list
> > Alsa-devel@alsa-project.org
> > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
