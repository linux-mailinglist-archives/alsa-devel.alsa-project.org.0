Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E64D647F78
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 09:43:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACB522137;
	Fri,  9 Dec 2022 09:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACB522137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670575431;
	bh=bEBBHJ8gQy66I6rLEPRWD3UIFxsmLWhromHP75SqHxw=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eIysUEP6L7DNk8eA+nma15Vb6LoMCvxmzRPNcdT3nKobYQCp221sEAhfES9kaVAgT
	 M/ndOzuZA5UZT/1S3E52AuMrCgoB/uPnKW+e4PbCQzPuIw0bR/Q6R46nkntKxbFlqS
	 88Vg/dDfk1v4MNkVIdd/rmdmY1R8QXr6XEGXJtd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D4CCF8024D;
	Fri,  9 Dec 2022 09:43:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72FF9F8022D; Fri,  9 Dec 2022 09:42:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67F7EF8016E
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 09:42:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67F7EF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WowHYmyT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670575377; x=1702111377;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=kIRgCfYgDmRWOiXbDjhYipu+Iwvtd6xLf7NkbullC7I=;
 b=WowHYmyTA6UqYolbUlipLdgjfP8K24swzsD8aYjYzuMo9R8bd/v8IUJr
 x0ICbuqr5b9iRULBNHjWiTVMRo2vzFat7xaPENxQRpEvj0WJ5gsK9exRz
 LA15O7dYjKO+d/lbMXY7nbWC3HnhgVRUTkC2QVjdfaTspfqn3WhdaHGOx
 8mt7ap92vVbP8nCnvF6ADlegfFLOJgvzp/xHBAqenJP1Je5vZ87Du4kw0
 sUdnNzP5Hw5ofYeKANt1xxTwTKkVldDmdkJFxyK1bddiY6sEOKYw/DhI2
 wrr7TLtUVkLCSiSIWYd7+EnmxqwOozXkjVP9u3Vq2thbNxMAsN1C2sFgU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="297766989"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="297766989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 00:42:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="753950171"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="753950171"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 00:42:26 -0800
Date: Fri, 9 Dec 2022 10:42:07 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: =?ISO-8859-2?Q?Amadeusz_S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 1/3] ALSA: hda/hdmi: fix i915 silent stream programming
 flow
In-Reply-To: <5dd6e067-bc93-ad01-8cf2-3bb5c9a45443@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2212091037140.3532114@eliteleevi.tm.intel.com>
References: <20221208154358.3848764-1-kai.vehmanen@linux.intel.com>
 <20221208154358.3848764-2-kai.vehmanen@linux.intel.com>
 <5dd6e067-bc93-ad01-8cf2-3bb5c9a45443@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 intel-gfx@lists.freedesktop.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Thu, 8 Dec 2022, Amadeusz Sławiński wrote:

> On 12/8/2022 4:43 PM, Kai Vehmanen wrote:
> > @@ -2879,9 +2879,28 @@ static int i915_hsw_setup_stream(struct hda_codec
> > *codec, hda_nid_t cvt_nid,
> >   				 hda_nid_t pin_nid, int dev_id, u32
> > stream_tag,
> >   				 int format)
> >   {
> > +	struct hdmi_spec *spec = codec->spec;
> > +	int pin_idx = pin_id_to_pin_index(codec, pin_nid, dev_id);
> 
> Shouldn't return value from pin_id_to_pin_index() be checked? It seems that it
> can return -EINVAL.

that's a good point. I think we are safe with current code as setup_stream 
ops is only called from generic_hdmi_playback_pcm_prepare() and 
spec->ops.setup_stream() there is only called with a valid pin. But this 
leaves room for future errors, and passing negative index to get_pin() is 
pretty bad. Let me send a V2 later today.

Thanks for the review!

Br, Kai
