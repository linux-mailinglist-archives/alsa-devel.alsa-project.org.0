Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE3742758
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 15:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C76D31737;
	Wed, 12 Jun 2019 15:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C76D31737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560345685;
	bh=eX+6oMiHecZgaahU3S1mVHqN2lYcXvdAxfo77m6k26c=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBDD8VEHS4bumqkmfam+viqUKFd6n+e2Mi8JdcN63ZponQVrLj1ZdTsHeJr3XLlMW
	 yFuL3C916Lsm6ed1y6IhgaFWXcqKH8tUSUyMzaTRGEDLnfHx32jX1ixY/abaFts78Q
	 Hsf6F/vu9fAQRkR18berl/zhE1HIPgDXUbJ352B8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3824FF896EA;
	Wed, 12 Jun 2019 15:19:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22ED2F896E0; Wed, 12 Jun 2019 15:19:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E973F80794
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 15:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E973F80794
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 06:19:33 -0700
X-ExtLoop1: 1
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2019 06:19:31 -0700
Date: Wed, 12 Jun 2019 16:20:29 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hzhmnm287.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1906121615310.4409@eliteleevi>
References: <20190612115509.3400-1-kai.vehmanen@linux.intel.com>
 <s5hzhmnm287.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: codec: hdac_hdmi: fix pin
 connections at cvt enable
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


On Wed, 12 Jun 2019, Takashi Iwai wrote:

> On Wed, 12 Jun 2019 13:55:09 +0200,
> Kai Vehmanen wrote:
> > +			curr = snd_hdac_codec_read(hdev, port->pin->nid,
> > +						   0, AC_VERB_GET_CONNECT_SEL,
> > +						   0);
> > +			if (curr != cvt_idx) {
> > +				snd_hdac_codec_write(hdev,
> > +						     port->pin->nid, 0,
> > +						     AC_VERB_SET_CONNECT_SEL,
> > +						     cvt_idx);
> > +				dev_dbg(&hdev->dev,
> > +					"%s: %s set connect %d -> %d\n",
> > +					__func__, cvt->name, port->pin->nid,
> > +					cvt_idx);
> 
> You can simply restore all pins without reading.  The read costs much
> more time than writes.

aa, thanks, you are probably right. I actually had just the write in my 
first version of the patch, but I ended up adding the read just be on the 
safe side. But true, write with same connection should not have any 
side-effects. I'll change this in v2.

Br, Kai

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
