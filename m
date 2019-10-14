Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9962D6A52
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 21:49:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465D7166E;
	Mon, 14 Oct 2019 21:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465D7166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571082547;
	bh=IHW0LW4BZlzc7wTqWcPtyTisS+APRLd/0u5efucVrrQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azac9sFNPGidvfrn+zRUAbc3TnS/IMDtoYmmKt5o6bHKQXdhcPq6XHd6voXMbZJRD
	 aS9UwgAdngHiHhxaS9nVgwnhUTzxMp8DWF4b/DOjVxBulfJSU7uQ4h3c3l288G1wbt
	 88G7Durl+tQ5cCkdMy+M/DWKeCqEnCFK6ZMgGHjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C7F2F80369;
	Mon, 14 Oct 2019 21:47:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4809DF8011D; Mon, 14 Oct 2019 21:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFF89F8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 21:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF89F8011D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 12:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; d="scan'208";a="194309101"
Received: from dmccormi-mobl1.ger.corp.intel.com ([10.251.80.150])
 by fmsmga008.fm.intel.com with ESMTP; 14 Oct 2019 12:47:09 -0700
Message-ID: <3811afd6d83c491077dd30089bcf836f56f146c3.camel@linux.intel.com>
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Date: Mon, 14 Oct 2019 20:47:07 +0100
In-Reply-To: <20191009181356.GO2036@sirena.org.uk>
References: <20191009181356.GO2036@sirena.org.uk>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Curtis Malainey <cujomalainey@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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

On Wed, 2019-10-09 at 19:13 +0100, Mark Brown wrote:
> Hi,
> 
> As in previous years we're going to have an audio miniconference so
> we can
> get together and talk through issues, especially design decisions,
> face to
> face.  This year's event will be held on October 31st in Lyon,
> France,
> the day after ELC-E.  This will be held at the Lyon Convention Center
> (the
> ELC-E venue) and will be free of charge to attend, generously
> sponsored by Intel.
> 
> Thus far for the agenda we have:
> 
>  - Use case management enhancements (Curtis)
>  - DSP framework integration (Liam?)
>  - Soundwire status (Pierre?)
>  - Componentisation status/plans (Me)

Audio Virtualisation. (Me).

Liam


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
