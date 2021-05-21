Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A0538D165
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 00:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86FE416A1;
	Sat, 22 May 2021 00:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86FE416A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621635814;
	bh=h9UKH7WJK8PH6MNlm+WUB1wHzLFT9LPT7y0vzDo85OQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Molptaj2FoAjGqtXsnuAyZgZfQecP4Syiv2dApCDAKPo/FvrEbYHLxyrNgoEIHXDC
	 FdXLlgBwud8ZeTwkcu3eLUZ5LkmdUKMCOV4eZNQxj35cz4ocL6CufSFHi4Isq+y4DZ
	 DiRugYpJkgDAlDE8xq8BTwDXyYo3vXIujwN/7ccU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DB26F80246;
	Sat, 22 May 2021 00:22:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF389F801DB; Sat, 22 May 2021 00:22:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B911FF800E5
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 00:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B911FF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LkI3WILX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ud4jTohy"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9EE545C0255;
 Fri, 21 May 2021 18:21:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 21 May 2021 18:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=HprtPpMhZPJmDlJYV2vvwIuW3Xh
 ypTk3HvX2jemPm8I=; b=LkI3WILXtfFuMxzWvJNef0Sr8gYyo2saSzIvJBVzQ+d
 yd8G5BXzvpHlBuFDAIdAeU9myE0+jcRwLMdljEcSZLb2EOnNTHnixMa+q7mIvU/h
 7IFOv2DW9WD0NAf1zKqOoJDU1QRBGFmnLH2i2Ys8sqd4n2ASOI3gd//JTn0RxeTl
 xLmHuMbr/+yDDXkuGfw+m5Int4pbaD32NCiI1OJu/WrjSxcEZ09RJIqF3Np9ZYVY
 DkZwsY4k512Y81zIrojP7MKlF6o9XZUqE/KoPC7GGvPxt2q2h8dTpZGsCgSZPrme
 /oc/mPO8SKmHgi05RNskhXMBl8boC3WpLZfDvoXDKTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HprtPp
 MhZPJmDlJYV2vvwIuW3XhypTk3HvX2jemPm8I=; b=ud4jTohy2a+Da9jXGiwC8s
 g/ikCoNIGxf51EKQdW6u7B8WhUezjBzXIwqDGQw5XI3YLmUpVexNPYHJfK0RkeRu
 QqvJyQUj19DGjwDvpxFFbUl0FgPCEcEFxO2NoEbY2ygE7/gX2hBuq3udpmJcsZaZ
 CMttXnVP0sWRC8ehgNsktACtMpQon4Smn2K2BlBJZfdffr9i0PgkSqm43SvisWgA
 cw/6LhVYDUMwn87kMsLYd67luqW+Zp/2jtozu+1cx9lEfcfN4XU2sQ7PJlXzQk1C
 MKrX0xC71LQLLRWWTxUYrYD2wIJ52PTdrIboNZ5AQHK0m/LAF3of8dLksqRYMkcQ
 ==
X-ME-Sender: <xms:fzKoYKw9skYHzzqLy70dR3A-hPrCS_iIhoNV5D-vl4YdFKbjCFg3UQ>
 <xme:fzKoYGTm0oem5gu7_-QAThgCV98AUoNjrAfEAUFWgQN5U9rxNYYTDhD00DaYSF6Va
 CMri12lEV_7uI9Nz_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeejgeeifeeuveeufeeigeegjeelvdfgjeegffejgfdv
 keelhefgtdefteejleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppe
 dugedrfedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:fzKoYMVIWmMTgrXq0M1CGZ382_iMkSVs5ngIxBWtduSRWcqW9KjUiQ>
 <xmx:fzKoYAhmUZua3gr1RVgd2v2ZsGdT4OS5Ki5BpEw32Kg6XoNj6Fr7HA>
 <xmx:fzKoYMBl934ir2pPZSzH6rF9DaO3XpFB5FR1rNA-c8hanz6_2nMYXQ>
 <xmx:gTKoYL540uhhHNo7o6zuVA9kb-BHj1a5ckL0dULXUCHjVNuGgr30hQ>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 21 May 2021 18:21:49 -0400 (EDT)
Date: Sat, 22 May 2021 07:21:46 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>, Colin King <colin.king@canonical.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: firewire-lib: Fix uninitialized variable err
 issue
Message-ID: <20210521222146.GA10202@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 Colin King <colin.king@canonical.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210520083424.6685-1-colin.king@canonical.com>
 <s5hh7ixh9qn.wl-tiwai@suse.de>
 <20210520130409.GA170303@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520130409.GA170303@workstation>
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

On Thu, May 20, 2021 at 10:04:09PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> On Thu, May 20, 2021 at 02:26:24PM +0200, Takashi Iwai wrote:
> > On Thu, 20 May 2021 10:34:24 +0200,
> > Colin King wrote:
> > > 
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > Currently in the case where the payload_length is less than the
> > > cip_header_size the error return variable err is not being set
> > > and function parse_ir_ctx_header can return an uninitialized
> > > error return value. Fix this by setting err to zero.
> > > 
> > > Addresses-Coverity: ("Uninitialized scalar variable")
> > > Fixes: c09010eeb373 ("ALSA: firewire-lib: handle the case that empty isochronous packet payload for CIP")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > 
> > Just a bikeshed, IMO, it'd be more proper to initialize err at the
> > beginning than setting 0 at every branch, e.g.
> > 
> > --- a/sound/firewire/amdtp-stream.c
> > +++ b/sound/firewire/amdtp-stream.c
> > @@ -652,7 +652,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
> >  	unsigned int payload_length;
> >  	const __be32 *cip_header;
> >  	unsigned int cip_header_size;
> > -	int err;
> > +	int err = 0;
> >  
> >  	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
> >  
> > @@ -683,7 +683,6 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
> >  		}
> >  	} else {
> >  		cip_header = NULL;
> > -		err = 0;
> >  		*data_blocks = payload_length / sizeof(__be32) / s->data_block_quadlets;
> >  		*syt = 0;
> 
> Thanks for the patches.
> 
> The error check is just done for the case to process CIP header, thus we
> can put the auto variable into the branch.
> 
> ======== 8< --------
> From 3fcca0062297e937c665f1c8e3a117e1187f4115 Mon Sep 17 00:00:00 2001
> From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Date: Thu, 20 May 2021 21:59:50 +0900
> Subject: [PATCH] ALSA: firewire-lib: Fix uninitialized variable err issue
> 
> The check of error is just done for the case that CIP header is available.
> 
> This commit moves auto variable into the branch to process CIP header.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: c09010eeb373 ("ALSA: firewire-lib: handle the case that empty isochronous packet payload for CIP")
> Suggested-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  sound/firewire/amdtp-stream.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
> index 37c8de8a..11ae4e88 100644
> --- a/sound/firewire/amdtp-stream.c
> +++ b/sound/firewire/amdtp-stream.c
> @@ -748,7 +748,6 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
>  	unsigned int payload_length;
>  	const __be32 *cip_header;
>  	unsigned int cip_header_size;
> -	int err;
>  
>  	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
>  
> @@ -766,6 +765,8 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
>  
>  	if (cip_header_size > 0) {
>  		if (payload_length >= cip_header_size) {
> +			int err;
> +
>  			cip_header = ctx_header + IR_CTX_HEADER_DEFAULT_QUADLETS;
>  			err = check_cip_header(s, cip_header, payload_length - cip_header_size,
>  					       data_blocks, data_block_counter, syt);
> @@ -779,7 +780,6 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
>  		}
>  	} else {
>  		cip_header = NULL;
> -		err = 0;
>  		*data_blocks = payload_length / sizeof(__be32) / s->data_block_quadlets;
>  		*syt = 0;
>  
> @@ -790,7 +790,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
>  	trace_amdtp_packet(s, cycle, cip_header, payload_length, *data_blocks,
>  			   *data_block_counter, packet_index, index);
>  
> -	return err;
> +	return 0;
>  }
>  
>  // In CYCLE_TIMER register of IEEE 1394, 7 bits are used to represent second. On
> -- 
> 2.27.0
> ======== 8< --------

Thanks for applying the patch but the commit in your tree includes
duplicated From/Data/Subject lines and causes failure of git-am for the
patch simply generated by git-am. Is it possible for you to modify
history of your for-next branch with enough correction?

 * https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=b493305483cb609abcf24c56f7415746c7e6939a

Regards

Takashi Sakamoto
