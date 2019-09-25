Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A320FBE08D
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 16:51:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27D97170F;
	Wed, 25 Sep 2019 16:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27D97170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569423088;
	bh=9B9BQuWYi3vl7QNOJntO8cWSZlvuVRXKkwnjfQJd24Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aq/NOsUrDLvjjWnPKalR0rbHrugEphSxTTF2DsiS9SwTQXqJ8A8ucSV4kT/vXURtW
	 rloc3sh4mGoXkJEXS9+9NjTaDBGkyOm3kzJfO1GpHYD42f/egZIoCr721TygwQt5vW
	 rYVWoi/V27d0xW7d7+Y4dH/E03qref3bwpwH/B10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 797E2F8049A;
	Wed, 25 Sep 2019 16:49:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4B78F8044C; Wed, 25 Sep 2019 16:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E47BF802BD
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 16:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E47BF802BD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 07:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="390232928"
Received: from igoley-mobl.amr.corp.intel.com (HELO [10.251.141.13])
 ([10.251.141.13])
 by fmsmga006.fm.intel.com with ESMTP; 25 Sep 2019 07:49:28 -0700
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
References: <CAEnQRZD6VsaKbjP1FaBMk5iT2jkk=baPUixVyWMNoqqRXM9hhw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <af8332a5-83f3-27a3-8202-7e5fee9483c3@linux.intel.com>
Date: Wed, 25 Sep 2019 09:49:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEnQRZD6VsaKbjP1FaBMk5iT2jkk=baPUixVyWMNoqqRXM9hhw@mail.gmail.com>
Content-Language: en-US
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] About soc_check_tplg_fes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 9/25/19 8:25 AM, Daniel Baluta wrote:
> Hi all,
> 
> In function soc_check_tplg_fes (sound/soc/soc-core.c)
> there is this code:
> 
>      for_each_card_prelinks(card, i, dai_link) {
> 
>          /* ignore this FE */
>          if (dai_link->dynamic) {
>              dai_link->ignore = true;
>              continue;
>          }
>          dev_info(card->dev, "info: override FE DAI link %s\n",
>              card->dai_link[i].name);
> 
> So, we ignore any FE DAI link but then the info message says the contrary.
> 
> Any idea?

Yes, there a couple of such BE/FE inversions in comments, likely 
copy/paste and typos. I just saw some earlier this week in the trigger 
error messages, e.g.

	err = dpcm_be_dai_trigger(fe, stream, SNDRV_PCM_TRIGGER_STOP);
	if (err < 0)
		dev_err(fe->dev,"ASoC: trigger FE failed %d\n", err);


We should really look for all comments with 'FE' or 'BE' and clean this up.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
