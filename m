Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DCDF276
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 11:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B4F716D3;
	Tue, 30 Apr 2019 11:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B4F716D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556615353;
	bh=nmslsci0gWnPsb5xMXIEaSvrcnAKccJHIk7ApVsbLMQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ORqYkx8jGeNIa9GVhL3J3SS/lk3cZhju4Q7AXue5EF7Jc7kq6S7eM//q9sWDvDaBw
	 tVIjTpr5GHR9c0xcXXdk7wVaaNbU21Azs6JRzl94j5FNkapW0uz/6pqi7XOvWf8+gB
	 UokrFWsG0Ve7utCHFDPOgi+1g6A6wU8SbcijODhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A85F896AA;
	Tue, 30 Apr 2019 11:07:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D13FEF896E3; Tue, 30 Apr 2019 11:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8E5FF8065C
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 11:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E5FF8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xCuWfKMe"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0ECE821670;
 Tue, 30 Apr 2019 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556614635;
 bh=2BAjUOkeV2diCEDyebE/TAVgpUaOzNFKZGF/5eYK40s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xCuWfKMeRms1wFCnCmz5hAdzhGJsrmYV5u8orcjtfHWWq9qrl1XiduiZGj1zP1s09
 m1cxKLEezealaJdpIkZ7JYntnVQn7SLdcZijX/Zy8dqeWAFoiJEJKzE5rnukRxXuHM
 mLf5ZVaUnyNQZheL1SvT8qsn4wYgHmp7lI/+yC8M=
Date: Tue, 30 Apr 2019 14:27:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190430085705.GT3845@vkoul-mobl.Dlink>
References: <20190411031701.5926-1-pierre-louis.bossart@linux.intel.com>
 <20190411031701.5926-3-pierre-louis.bossart@linux.intel.com>
 <20190414095839.GG28103@vkoul-mobl>
 <08ea1442-361a-ecfc-ca26-d3bd8a0ec37b@linux.intel.com>
 <37c5af39-a1e4-adc3-e8a9-bcada8e3b35b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37c5af39-a1e4-adc3-e8a9-bcada8e3b35b@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v3 2/5] soundwire: fix style issues
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 19-04-19, 12:14, Pierre-Louis Bossart wrote:
> =

> > > > =A0 enum sdw_command_response
> > > > =A0 cdns_xfer_msg_defer(struct sdw_bus *bus,
> > > > -=A0=A0=A0=A0=A0=A0=A0 struct sdw_msg *msg, struct sdw_defer *defer)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct sdw_msg *msg, struct sdw_=
defer *defer)
> > > =

> > > this one too..
> > > =

> > > > =A0 static int cdns_port_params(struct sdw_bus *bus,
> > > > -=A0=A0=A0=A0=A0=A0=A0 struct sdw_port_params *p_params, unsigned i=
nt bank)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct sdw_port_para=
ms *p_params, unsigned int bank)
> > > =

> > > here as well.. (and giving up on rest)
> > =

> > Please check for yourself that this is a diff illusion w/ tab space.
> =

> Vinod, can you please double-check, the alignment issues you reported don=
't
> exist, see e.g. below what the code looks like after merge.
> =

> =

> int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
>                        struct sdw_defer *defer)
> =

> int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
>                  u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf)

Sure, please split up as requested and I shall test apply and check
alignment before reporting...

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
