Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC69CB908
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 13:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356F41685;
	Fri,  4 Oct 2019 13:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356F41685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570188086;
	bh=PKxFeN/drVH6ARm76fDFwAGdrlrZkaDZ+hjb/WBQl5s=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhRWlDQScZLjPxZ9a2I863MPTIzJZ0U7YC64qq9y9gH2SzGNZf9p1gl4+9dnZuJo2
	 /AkOHVahi0KlI/MlIDv6LEnuqyOAPP9b+SAU+Zy/zI7Y4/Y1+WkAUOeFE9I0cFkL+c
	 WYLX3Sekuli3JEqYnfvHJWVa2fbNZwv5b5dG6el8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9591DF803F3;
	Fri,  4 Oct 2019 13:19:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D84EF80391; Fri,  4 Oct 2019 13:19:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06D4DF800DE
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 13:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06D4DF800DE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 04:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="204271406"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga002.jf.intel.com with ESMTP; 04 Oct 2019 04:19:31 -0700
Date: Fri, 4 Oct 2019 14:19:30 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: ed nwave <ed.nwave@gmail.com>
In-Reply-To: <CACtB+u13jj1_Q1EgyP13i0VCyN9vEjJpsSt8vbhwvbY4q4a7vA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1910041416100.16459@zeliteleevi>
References: <CACtB+u13jj1_Q1EgyP13i0VCyN9vEjJpsSt8vbhwvbY4q4a7vA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Custom Kernel driver to open and use another ALSA
 PCM
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

On Wed, 2 Oct 2019, ed nwave wrote:

> A little bit of an unorthodox request but I need my custom PCM driver to
> connect directly to another PCM driver if possible. I have an application
[...]
> As an example, my PCM driver acts as a sound card connected to a microphone
> capture application, within the my custom PCM I've added various "dalek"
> and other voice changing alterations and now I need to output this stream

I have to ask why you are doing this in kernel? From performance and 
latency point of view, PCM processing should be in user-space (see e.g. 
JACK and Pulseaudio for old examples).

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
