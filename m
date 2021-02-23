Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406DA32300F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 18:57:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D01411679;
	Tue, 23 Feb 2021 18:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D01411679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614103044;
	bh=0kboFUgXKFK0tKD4tNtHwwjzB3HIKgIAIs89whvHWsU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H32qV4dNTc2gYSE47eJgbjJBb6BtE866VYJWFXaXGLG+RyJr9bc8EcG+9TW9ObZX4
	 OseWgH8QiEgvDB0Y6AX1AcG+iD3ZfGHG4luhY0Im2s1e5IlwFH/0PlQud6/eJUU1Eh
	 1hjy/mVGWkMR+R/TWExU433JSenInDdOm7KhP8UA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B9B9F80167;
	Tue, 23 Feb 2021 18:55:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7E40F8016A; Tue, 23 Feb 2021 18:55:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEB78F800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 18:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEB78F800B4
IronPort-SDR: V9qSgrh0OaQjuIFIQbVxOLbvIfgrfwOtVA2ZWwxEIasTk0XwU2sfLS5LXsVNdAji4mrYYiq3OE
 RXEKmTd9eYDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="246314300"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="246314300"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 09:55:39 -0800
IronPort-SDR: y2+gOpbm/4lMp9Y24HY6Y/GrnehvbVaXjOqubUeV65juMp4rAiVhH9pxTzMdcjIYm24/uDJptY
 iUhkIlvEB6pA==
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="441809765"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 09:55:11 -0800
Date: Tue, 23 Feb 2021 19:51:28 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
In-Reply-To: <s5hsg5mu4ko.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2102231918010.864696@eliteleevi.tm.intel.com>
References: <20210223122205.233701-1-hui.wang@canonical.com>
 <alpine.DEB.2.22.394.2102231545050.864696@eliteleevi.tm.intel.com>
 <ccc1fd32-5838-a2ca-39aa-75ef2d7e3b16@perex.cz>
 <s5hsg5mu4ko.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hi,

On Tue, 23 Feb 2021, Takashi Iwai wrote:

> On Tue, 23 Feb 2021 17:25:23 +0100, Jaroslav Kysela wrote:
> > A dumb question: Does TGL really support up to 11 separate displays or it's
> > just to handle 11 connections and the number of maximal simultanenous
> > connected displays is lower? In the later case, the dynamic allocation makes
> 
> That's the latter.  And, the fixed assignment was merely for
> compatibility with legacy usage, and supposed to be 3 fixed ones or
> so.  Extending to that high number wasn't intended when the mechanism
> was introduced.  We should have noticed it at ICL support (which has
> up to 6 devices).

yes, exactly. The pins relate to physical ports. There are more pins now 
to cater for various DP-over-USB-C topologies (versus just native HDMI and 
DP ports). Most product have less physical ports connected, but on the HDA 
interface all pins are exposed. Each pin does provide functionality to 
query whether a display is connected to it, and whether the connected 
display has audio capability.

The maximum number of concurrent displays is described as converters.
On TGL this is 4.

With SOF, we didn't have legacy userspace, so the HDMI/DP PCMs are already 
exposed differently and only a small number (3 or 4) of PCMs are created 
depending on hardware generation. Now the question is how we move 
snd-hda-intel to similar model with minimal distraction to existing 
user-space.

Br, Kai
