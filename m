Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A87435ED10B
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 01:33:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0672A84C;
	Wed, 28 Sep 2022 01:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0672A84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664321597;
	bh=dDpA331yadXH7kE2bf7N5ubVLSdPzEQpYDPIUgyJZ1s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ih7DrwdqRVP6yC2bHfaozrFAkhM8jZoRR6qlC6SzCrvm9HjQKjDZh+xcU0ICRC39m
	 NT0l4F9iFoLBWcy6BiRW8+NeayXye4qKjOTCSL34EaECvLFsee3Kwu/0uYc0YQbsCs
	 3zYxBynZsb6nlRQCU+d9jMYupKEVyZPBUyeMe9kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C58F8011C;
	Wed, 28 Sep 2022 01:32:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DA98F8025E; Wed, 28 Sep 2022 01:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BC30F8011C
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 01:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BC30F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="xRpltdoE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S8UJUP0VBuQngd2OEhP0OtJLPeHHAHk+DG1PtoI2pnk=; b=xRpltdoE+BX4wJj6Dn/xqNhxlx
 dNbrhZ20jxjllsS1ta1wO+7ebIr+chPK780UY/3Y9XqriWy5TXjz53IfQpA4PQyuszNpgBF79SQ90
 MKDt/qDALUhpwL/XrjAZzfRVunyxJkfVw3Ka5tk/dqfXjOlsuK0gfBzsGkVG8CToVfU/QRQ+T3nXY
 1wXjQlbfLxb9c/A3hML8pHwk6Qg0VU+eNHdUV1EmLgPH1LTXTjrJr6hx5jOyiC6Lyorup2B3f6XQb
 VQ5Y5BFREOKh5/3Wy8fn0pJIaHZ2+oVmAwD3b9hu1B7FEM9SmJs+RGTJBR8xNdMndP/c5/HTG1pcl
 VCYMtUqQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1odK3O-00D9Po-9y; Tue, 27 Sep 2022 23:31:54 +0000
Date: Tue, 27 Sep 2022 16:31:54 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH v6 0/4] Let userspace know when snd-hda-intel needs i915
Message-ID: <YzOH6oV6B6UKb7DF@bombadil.infradead.org>
References: <cover.1652113087.git.mchehab@kernel.org>
 <Ynl7xGy+a9MYjXi1@bombadil.infradead.org>
 <20220920072454.4cf91f24@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920072454.4cf91f24@maurocar-mobl2>
Cc: alsa-devel@alsa-project.org, Richard Weinberger <richard@nod.at>,
 Kai Vehmanen <kai.vehmanen@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-modules@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 linux-mtd@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

On Tue, Sep 20, 2022 at 07:24:54AM +0200, Mauro Carvalho Chehab wrote:
> Hi Luis,
> 
> On Mon, 9 May 2022 13:38:28 -0700
> Luis Chamberlain <mcgrof@kernel.org> wrote:
> 
> > On Mon, May 09, 2022 at 06:23:35PM +0200, Mauro Carvalho Chehab wrote:
> > > Currently, kernel/module annotates module dependencies when
> > > request_symbol is used, but it doesn't cover more complex inter-driver
> > > dependencies that are subsystem and/or driver-specific.
> > >   
> > 
> > At this pount v5.18-rc7 is out and so it is too late to soak this
> > in for the proper level of testing I'd like to see for modules-next.
> > So I can review this after the next merge window. I'd want to beat
> > the hell out of this and if possible I'd like to see if we can have
> > some test coverage for the intended goal and how to break it.
> 
> Any news with regards to this patch series?

0-day had a rant about a bug with it, it would be wonderful if you can
fix that bug and rebase. Yet again we're now on v6.0-rc7 but it doesn't
mean we can't start testing all this on linux-next. I can just get this
merged to linux-next as soon as this is ready for a new spin, but we
certainly will have to wait until 6.2 as we haven't yet gotten proper
coverage for this on v6.1.

Is there any testing situations you can think of using which can demo
this a bit more separately from existing drivers, perhaps a new
selftests or something?

  Luis
