Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE3160712
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 00:00:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C7491676;
	Sun, 16 Feb 2020 23:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C7491676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581894047;
	bh=uaqnCc9CQTaUcRuX9w5QL6UDt4wVOeF0LL9tgIC0yxo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vHwOm7pEwqs0H92sNAXRVB1xnlVRUq8gckgtmp1/jMRr8yTS7pAYaHvWt2xdVvJRP
	 SvsOXJWzmp+qdUzRsQB6RilCOQKgirrA95ewijHqchgkAi8uR8ImISJTBGzYwFBDrJ
	 0O1eizaVTL3oRBGtK2oy/C42JvAJKDx4dgG9x28U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BEDF80148;
	Sun, 16 Feb 2020 23:59:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1279F80145; Sun, 16 Feb 2020 23:59:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93D04F800B6
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93D04F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Gsse9hku"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EDKdhNrm"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 275C421ADD;
 Sun, 16 Feb 2020 17:58:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 16 Feb 2020 17:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=EsTPmzb6zG9O6+2AM55jBBA//Au
 MbfDGflEAArzYsyU=; b=Gsse9hkuys8QJM6+mZsQc5kbt/G0rkv93mysWsY8uEw
 VQvYi5w15fIsu9ZfY6F2IvNqfRGUq5MRkY2/oTJZzSn9PTp7E79Q2m1AalfewLEJ
 VcMvyhOiLZbH2WhRkI9U/Nh9hzscdLIrrNKboJhanygKdykYJfqw2xutTrWP0XXA
 3yQOhysmcOaSVHNXpGvExlZHLsjkybz76crAlTlX6AlpxnBxBrBUa/nA+ysh87o8
 8e9vPSJmLdLbFrv9wzt9rzGv2p0J6fJFDlZAxUim37gx/EVcneYmNhy0a47AhDlM
 fg289Vbb++JLEPmkHEMJN3BcqME11a9I2PKAOooKyuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EsTPmz
 b6zG9O6+2AM55jBBA//AuMbfDGflEAArzYsyU=; b=EDKdhNrmj7N98gTUR7Uzti
 PgLVP+ptg/WX8ezKr5HkMoofo2XmT9AK6O581o6tw7NEFD4X8K5JusKxWhpTx1+n
 pWk960uu4HkxBAjf4d0lsQpaR7bnEL6YhmcD+Jka1DBvacZ/HfiyPDEiS2lloycm
 uQbG+8RjtIqGLfkIwHujEcvB26L0eHLdpUrNUM3hMBse8dgeIyga0QNjOVOQabGD
 /2m6eabng4qZH8OXPQVEa2BWFa6ywPmzq6GzU2DAxXcU1deM/TtQiPRRpeskhQ5b
 h5KTzPE8M0bAFEppFQrWQmJHyV1Umr9d+gb43C5SpaYbz/hXd2FeF4h8AHa4OKDA
 ==
X-ME-Sender: <xms:MMlJXrZZ-31DMgZF-I5ps8u-aS9XYDgE8CEJU73azAn7tJgvUGpVvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjfgesthdtre
 dttdervdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpedvuddrrghsnecukf
 hppedugedrfedrjeegrdduieeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:MMlJXlacfVfQ75rMi61fiISCxANdynLjpgC3Vys-Bi93yyzMGYpLpQ>
 <xmx:MMlJXs-I6eC5BbzFIjIGDnlvxov4FMpXU7yTS8M6D-J6Sovro5rKtg>
 <xmx:MMlJXjVNP6AS5WIcgAyeOzu1hgQ5tiE1O1QkGNbYAuldG7JktqHC8A>
 <xmx:MclJXopwwMPD0TGQozvVzL2TTK6w0ogkKht1xaoL3suNwxH29nKx8g>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id 937A63060D1A;
 Sun, 16 Feb 2020 17:58:55 -0500 (EST)
Date: Mon, 17 Feb 2020 07:58:53 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: roberto lopez torres <lotojr@live.com.mx>
Message-ID: <20200216225852.GA3783@workstation>
Mail-Followup-To: roberto lopez torres <lotojr@live.com.mx>,
 alsa-devel@alsa-project.org
References: <BYAPR10MB36861118D3D6AF53A14C801E98170@BYAPR10MB3686.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR10MB36861118D3D6AF53A14C801E98170@BYAPR10MB3686.namprd10.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Duet Firewire
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
(C.C.ed to alsa-devel)

On Sun, Feb 16, 2020 at 03:52:27AM +0000, roberto lopez torres wrote:
> Hi, i just got a Duet Firewire, and i'm trying to make it work with 5.3.0-29-gen
> eric #31-Ubuntu
> 
>    I have inputs and outputs from the interface but can't config anything
>    at the moment, and i got a noise every 16 seconds on headphones
>    monitoring.
> 
>    I'm pretty new using linux.

The ALSA support for Apogee Duet FireWire starts at Linux kernel v4.21.
As you can see, the support is just for packet streaming, thus it's just
possible to transmit/receive PCM frames and MIDI messages. However, the
device is designed to run just depending on its internal clock (e.g.
47994 frames/sec), thus at present it generates periodical noise since
the ALSA driver is designed to transmit just the same number of PCM
frames as sampling rate (e.g. 48000 frames/sec).

The support of any control is expected to be implemented in userspace
application. This is the reason that you can see no elements in ALSA
control application (e.g. alsamixer). However, the protocol to control
the device is not clear yet. As long as I know, it's complicated and
requires the batch of codes for the application. This is the reason
that ALSA in-kernel driver doesn't have the code.


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
