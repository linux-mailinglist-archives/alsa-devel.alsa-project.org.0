Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 139742C2E0D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:09:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AC7E1765;
	Tue, 24 Nov 2020 18:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AC7E1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237798;
	bh=VEGy54rcLCho40R+6JbprsRZooc9e7x1ylV8+ruCN0g=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LUrsdUGH1T2rtXGum007x2vYyUaQ2+r3+G1YVcitnLgqZxTG/O5eXSkZEQgOyePgo
	 F3TT3oMY+Qkt7kQkkcRFs1A1HAL1xrBZuI2q6NKa7Y8+liFjaP2gkhX+cBeW8raJZs
	 PsvpQHMOHXEaMb6tXN57W48ps4UwFJvZbzFNnpIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3495FF805AB;
	Tue, 24 Nov 2020 17:58:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B4B8F80165; Sun, 22 Nov 2020 20:54:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [IPv6:2607:fcd0:100:8a00::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47904F8015B
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 20:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47904F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="Xy60wiIz"; 
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="Xy60wiIz"
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5AE091280408;
 Sun, 22 Nov 2020 11:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606074839;
 bh=VEGy54rcLCho40R+6JbprsRZooc9e7x1ylV8+ruCN0g=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=Xy60wiIzsyTeElUeeJd3QYsiHNZfzmGET/Nzo9eZo2OJxmb5EOyvszf5Q8Et12YN3
 QzMj8C6lMBcV0iKMn2xQmIYhyRP6O8RGeJWdk6ZnR1Mz2fkvBJLWRT04tHjc221TnA
 rtTRX0GCrDoOkJiVFq/y98T9XhefjbMkzX0sdCSc=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id KaMwHtHCHbnw; Sun, 22 Nov 2020 11:53:59 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D0B171280404;
 Sun, 22 Nov 2020 11:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606074839;
 bh=VEGy54rcLCho40R+6JbprsRZooc9e7x1ylV8+ruCN0g=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=Xy60wiIzsyTeElUeeJd3QYsiHNZfzmGET/Nzo9eZo2OJxmb5EOyvszf5Q8Et12YN3
 QzMj8C6lMBcV0iKMn2xQmIYhyRP6O8RGeJWdk6ZnR1Mz2fkvBJLWRT04tHjc221TnA
 rtTRX0GCrDoOkJiVFq/y98T9XhefjbMkzX0sdCSc=
Message-ID: <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Jakub
 Kicinski <kuba@kernel.org>
Date: Sun, 22 Nov 2020 11:53:55 -0800
In-Reply-To: <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:06 +0100
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 x86@kernel.org, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
 linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

On Sun, 2020-11-22 at 11:22 -0800, Joe Perches wrote:
> On Sun, 2020-11-22 at 11:12 -0800, James Bottomley wrote:
> > On Sun, 2020-11-22 at 10:25 -0800, Joe Perches wrote:
> > > On Sun, 2020-11-22 at 10:21 -0800, James Bottomley wrote:
> > > > Please tell me our reward for all this effort isn't a single
> > > > missing error print.
> > > 
> > > There were quite literally dozens of logical defects found
> > > by the fallthrough additions.  Very few were logging only.
> > 
> > So can you give us the best examples (or indeed all of them if
> > someone is keeping score)?  hopefully this isn't a US election
> > situation ...
> 
> Gustavo?  Are you running for congress now?
> 
> https://lwn.net/Articles/794944/

That's 21 reported fixes of which about 50% seem to produce no change
in code behaviour at all, a quarter seem to have no user visible effect
with the remaining quarter producing unexpected errors on obscure
configuration parameters, which is why no-one really noticed them
before.

James


