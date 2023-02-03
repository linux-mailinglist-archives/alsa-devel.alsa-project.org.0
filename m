Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7710D689277
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 09:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C09AA4B;
	Fri,  3 Feb 2023 09:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C09AA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675413578;
	bh=/PA5B2UfTLW8o56P3800UFEzmzZSk6ZCDfweudu2H5U=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BtgCJE2UBPmZZULhaumuOabNlO9MdmgvnFOD/IqdBGvoKxsfnYqv/fY3fNlxO/cr/
	 tq2Yuc6euPMXVVDtO1HHOx2EhkBLxHxrl/7ACCmhRd4b5EqLFRuFbdnLuayEs0q1Xe
	 FiariHpD7joyIYMd44xkOy27IrbULB4w3nrvUDWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE966F8053D;
	Fri,  3 Feb 2023 09:37:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49F1FF8032B; Fri,  3 Feb 2023 09:30:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 276B2F800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 09:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 276B2F800E3
Received: by verein.lst.de (Postfix, from userid 2407)
 id 494A367373; Fri,  3 Feb 2023 09:30:38 +0100 (CET)
Date: Fri, 3 Feb 2023 09:30:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: remove arch/sh
Message-ID: <20230203083037.GA30738@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 03 Feb 2023 09:37:52 +0100
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wrote:
> Since this is my very first time stepping up as a kernel maintainer, I was hoping
> to get some pointers on what to do to make this happen.
> 
> So far, we have set up a new kernel tree and I have set up a local development and
> test environment for SH kernels using my SH7785LCR board as the target platform.
> 
> Do I just need to send a patch asking to change the corresponding entry in the
> MAINTAINERS file?

I'm not sure a there is a document, but:

 - add the MAINTAINERS change to your tree
 - ask Stephen to get your tree included in linux-next

then eventually send a pull request to Linus with all of that.  Make
sure it's been in linux-next for a while.
