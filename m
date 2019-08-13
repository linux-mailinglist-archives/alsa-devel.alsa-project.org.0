Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A56BD8B58A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 12:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38EAB1668;
	Tue, 13 Aug 2019 12:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38EAB1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565692018;
	bh=HLsw7N3/gx28GmyOU7tthyKHaRrHUGJXZ02YIg8EJe8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ll/8rZg6AY04QFa609jAyzOjNi6C+T0dc8PtpgfBTSAung/W5jPbzT+JFojuTPUNA
	 AeQ/CwK0DI0A3iacs4DCnnWzXYJcXy/Gtk9tvnC4kRluSfTtGnYnho9yzbrGi2rUr9
	 O4z5L2ZdeYSBcTA7GWwojCwC/qG1PmBLUKqvc9Lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 837B9F8026A;
	Tue, 13 Aug 2019 12:25:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3781FF8026A; Tue, 13 Aug 2019 12:25:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 30941F8015A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 12:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30941F8015A
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 560AE805C;
 Tue, 13 Aug 2019 10:25:22 +0000 (UTC)
Date: Tue, 13 Aug 2019 03:24:51 -0700
From: Tony Lindgren <tony@atomide.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190813102451.GJ52127@atomide.com>
References: <20190809070003.GA52127@atomide.com> <s5hwofmhkbs.wl-tiwai@suse.de>
 <20190809074643.GB52127@atomide.com> <s5hv9v6hhm9.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hv9v6hhm9.wl-tiwai@suse.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] Regression in next with codec unload
	and	snd_soc_component_get/put
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

* Takashi Iwai <tiwai@suse.de> [190809 08:24]:
> On Fri, 09 Aug 2019 09:46:43 +0200,
> Tony Lindgren wrote:
> > 
> > * Takashi Iwai <tiwai@suse.de> [190809 07:25]:
> > > On Fri, 09 Aug 2019 09:00:03 +0200,
> > > Tony Lindgren wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > Looks like commit 4a81e8f30d0b ("ASoC: soc-component: add
> > > > snd_soc_component_get/put()") causes a regression where trying
> > > > to rmmod a codec driver fails with module is in use error after
> > > > rmmod of snd-soc-audio-graph-card for example.
> > > > 
> > > > Any ideas what goes wrong there?
> > > 
> > > There is an obvious typo: soc_cleanup_component() should call
> > > snd_soc_component_module_put_when_remove() instead of *_close().
> > 
> > Making that change locally seems to fix it thanks.
> 
> ... and it was already fixed in the later commit 0e36f36b04e7
> "ASoC: soc-core: fix module_put() warning in soc_cleanup_component".

Mark, looks like this commit is still not in Linux next, forgot
to push out something?

Regards,

Tony
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
