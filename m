Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C660D3E2B70
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 15:33:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6356016C6;
	Fri,  6 Aug 2021 15:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6356016C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628256814;
	bh=rohfV+kzlCOJm9ZTfN28JssDicC5wE4LbSMwkozraVA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DP9gmHuPU6yQiSn7XYNnPSYdhP8/qziJU97TWhLp5CK0AyhovXC22V58ZGmuqcgwW
	 UZhn1KQE4M40fGwzPWOEO6sV1Unk8vGW5xc3pyybUCygjFGdjZGUTy3rXuUZ3NIOtX
	 qdiWXrZr88PvrourMJB70JzXbTotZNMCS9bhxCbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C217AF80268;
	Fri,  6 Aug 2021 15:32:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5515DF8025F; Fri,  6 Aug 2021 15:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CC29F8010A
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 15:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CC29F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TI0HL/y/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF26161078;
 Fri,  6 Aug 2021 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628256717;
 bh=rohfV+kzlCOJm9ZTfN28JssDicC5wE4LbSMwkozraVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TI0HL/y/43X06vZtdhGBE3lhgG26ndcuOkiIivpDZAub1ayGBRXY/JmUJcPxn+tuO
 ya6xR8mBqpKzGTIcIOHTNgb0ds+lpqJeY/NA+jn1AUVIF2oyDyUaO4MKBJXyEimQd9
 ALzFA89BilH65gWFbHbV/QqKUerHB7ni5sQDwKbgAH7SnHcrIWGxgEP2wizasrcpOt
 EdwMD28CSOIM8blxD6DS83whJdmr7bermAMebPQ6A5PWH0i7I/O2DBFHta2a2oORng
 vL+6jPsIRC2p8ZjkL+HaEMgybAD/+F8dC7og7BuLiaS/k5fR47Ov8FfEyfXRC9saaj
 FgIIW4XAIJaPg==
Date: Fri, 6 Aug 2021 19:01:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/4] soundwire: intel: exit clock stop mode on system
 suspend
Message-ID: <YQ05yYz1UR9Du92R@matsya>
References: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
 <20210727055608.30247-4-yung-chuan.liao@linux.intel.com>
 <YQd1C0QQMDNtzfAq@matsya>
 <792f70bd-b4ae-e3a1-c37e-ba2913018d0b@linux.intel.com>
 <2b7f632d-e8b2-7a14-54c6-86d19ca4ba01@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b7f632d-e8b2-7a14-54c6-86d19ca4ba01@linux.intel.com>
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
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

On 02-08-21, 11:28, Pierre-Louis Bossart wrote:
> 
> 
> 
> >> 1. In above you are calling resume of child devices first and then intel
> >> device, which sounds reverse, should you not resume intel device first
> >> and then child (codec devices) ?
> >>
> >> 2. What about when resume is invoked by the core for the child devices.
> >> That would be called in the PM resume flow, so why do it here?
> > 
> > I realize it's a complicated sequence, it took us multiple phases to get
> > it right. There are multiple layers between power domain, bus and driver.
> > 
> > The .prepare phase happens before the system suspend phase. Unlike
> > suspend, which progresses from children to parents, the .prepare is
> > handled parent first.
> > 
> > When we do a request_resume of the child device, by construction that
> > also resumes the parent. In other words, if we have multiple codecs on a
> > link, the first iteration of device_for_each_child() will already resume
> > the parent and the first device, and the second iteration will only
> > resume the second device.
> > 
> > What this step does is make sure than when the codec .suspend routine is
> > invoked, the entire bus is already back to full power. I did check
> > privately with Rafael (CC:ed) if this sequence was legit.
> > 
> > We did consider modifying the system suspend callback in codec drivers,
> > so that we would do a pm_runtime resume(). This is functionally
> > equivalent to what we are suggesting here, but we decided not to do so
> > for two main reasons
> > 
> > a) lots of code changes across all codecs for an Intel-specific issue
> > 
> > b) we would need to add a flag so that codec drivers would know in which
> > Intel-specific clock-stop mode the bus was configured. That's not so
> > good either.
> > 
> > It seemed simpler to use to add this .prepare step and test on the Intel
> > clock stop mode before doing a pm_runtime_resume for all codecs.

Ack, the code looks neat. But glancing at it, reader might get confused
about the sequencing done here.. It is not very obvious, so consider
adding this to changelog or driver comments. It will be helpful

> 
> Note that we could invert the two parts and do a parent resume first,
> and a loop for all children second. It's completely equivalent, but
> might be less convoluted to understand without any implicit behavior
> assumed.

Agree, it would be redundant as PM core would take care of it. maybe
add a comment so that it is explicit

-- 
~Vinod
