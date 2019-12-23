Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651391293B7
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2019 10:44:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01D981675;
	Mon, 23 Dec 2019 10:43:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01D981675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577094271;
	bh=BNTMe2UBHjNy/LOuDXl14hR8UP6FOI+Zos4bTAYvUl0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I9Dbt/ol7J7QoJBlb+ILFZXjrQPqJM9B+4vut9AWOJ7C0lu7VZTDD0jhvh+uD0Ib5
	 qCBLUSZ9t5sX6rKiaJZhnnAvK2HbEpiRBIm7JxMN2fsLXE3FPoJ7d3xtZ9dbhE0QG7
	 qTsA3b499rcOnMtfDK15852cTKAtNhLpJVD+pQ2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79EB5F80132;
	Mon, 23 Dec 2019 10:42:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5F7EF80130; Mon, 23 Dec 2019 10:42:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14CB9F800AD
 for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2019 10:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14CB9F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="7LnUOXDr"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FSa7JQLH"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8BBE26DA;
 Mon, 23 Dec 2019 04:42:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 23 Dec 2019 04:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+fLWAYPWZIaw1Zqkpb8XGCayYGJ
 T5gTpaf5XnI0uavY=; b=7LnUOXDrm0KSpq3537DPy4fY+/PmWZn0XfMkaGa3fkw
 RnrrlI/rM9nnJQTZKuzfLXGTCjYHa9OdGMSx9WIRffgM6d2YpdPWywwijJr+vUXm
 TFb9T7Sna3sudKurD1B2GHIW+I/kMGu/ilReHY+rrOp2MqAdGQeo/b+LQuR0Amtg
 gWpoiSmpeYVK2ncS34m/MpHwpAH0l/mYnkMVzlXAEV60h4l3vtKLzQ8lY4NctP1Q
 jQxIYt9tU7zErI1KRj2zmsDWduuNqKk8JOaH5JYE0x2ZPLJwliNYao3iDVzq2Q40
 7wK73+kTuw7CcklTqF+Y8FzmuSza7pzwhekvmEGMuOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+fLWAY
 PWZIaw1Zqkpb8XGCayYGJT5gTpaf5XnI0uavY=; b=FSa7JQLHmeCXswNlvtI/jb
 CqMnS1sC3xfFEDW54vusdQegD3INMp4NZr+s5+O6FJ2m7mbWxkIqKKYaZJlNYOAz
 vCN24eZ34nWasGihR8/NQ1yizPhd54JJbndkCrBUqDaSxATX1BUWk4a/ho8E7hkM
 VqGdOs4Otxrtqt7AAGUhzcYb2ahBczkiOGffYvv9j5WLVQrAmFpiDfVZmzRdBCTi
 ufrYC53Scvui3NIhnqnht2Eb+ZTL1F1RJTtl1Yt6RKX6yU77DYkPnAo+Y3BEOJVH
 dE4vZRZW3onW27Bpalo0Iru5Ga6zNIqB4slT8n0vj9N4zDZWsHzLVMnEAtTtfWIw
 ==
X-ME-Sender: <xms:DYwAXs7gsONTH7-C55VyQN2HULCBEL1EwD2hpaKxBlmNiu1zf8aIlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvtddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujggfsehttd
 ertddtredvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucffohhmrghinheptggrrhgurdhnvg
 ifpdhgihhthhhusgdrtghomhdprhgvrgguthhhvgguohgtshdrihhonecukfhppedugedr
 fedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:DYwAXln79euuizoFoA_20A1478VD5ks6_VEszxuJC5MTRxicvUr4GA>
 <xmx:DYwAXhSROKGhSqX0_cNtUMbLz6odmjEYda6dvJh3pEGhdI7LyvZlMA>
 <xmx:DYwAXigAsGiBSC2avAkR62DeeEKD-93O1yRy_4LE9MogddWiNS2FNQ>
 <xmx:DowAXoXA9Gp0K-pnJH9fdlPDNO15QiAq89ZrFgu21wAwx3vAOIkNdA>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D882180062;
 Mon, 23 Dec 2019 04:42:36 -0500 (EST)
Date: Mon, 23 Dec 2019 18:42:34 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Message-ID: <20191223094233.GA15438@workstation>
Mail-Followup-To: tiwai@suse.de, alsa-devel@alsa-project.org
References: <20191223093347.15279-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191223093347.15279-1-o-takashi@sakamocchi.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: ctl: allow TLV read operation for
 callback type of element in locked case
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

On Mon, Dec 23, 2019 at 06:33:47PM +0900, Takashi Sakamoto wrote:
> At present, when an element has callback function for TLV information,
> TLV read operation returns EPERM if the element is locked. On the
> other hand, the read operation is success when an element has allocated
> array for TLV information. In both cases, read operation is success for
> element value expectedly.

You can regenerate the issue by executing below Python 3 scripts:
(Installation of alsa-gobject[1], PyGObject[2] and amixer(1) in
alsa-utils is required.)

After element is locked, amixer reports EPERM for any read operation of
TLV information.

```
#########after locked#########
numid=28,iface=PCM,name='Playback Channel Map'
  ; type=INTEGER,access=r---lR--,values=6,min=0,max=36,step=0
  : values=0,0,0,0,0,0
amixer: Control hw:1 element TLV read error: Operation not permitted
```

======== 8< --------
#!/usr/bin/env python3

from sys import argv,exit
import subprocess

import gi
gi.require_version('ALSACtl', '0.0')
from gi.repository import ALSACtl

def lock_elems(card, targets, locked):
    for target in targets:
        card.lock_elem(target, locked)


def run_amixer(label, targets):
    print('{:#^30}'.format(label))
    args = ['amixer', '-c', str(card_id), 'cget', '(placeholder)']
    for target in targets:
        args[4] = "iface=PCM,name='{}'".format(target.get_name())
        subprocess.run(args)


if len(argv) < 2:
    print('One argument is required for the numerical ID of soundcard.')
    exit(1)
card_id = int(argv[1])

card = ALSACtl.Card.new()
card.open(card_id)

targets = list(filter(lambda e: e.get_name().find("Channel Map") >= 0,
                  card.get_elem_id_list()))
run_amixer('before locked', targets)

lock_elems(card, targets, True)
run_amixer('after locked', targets)

lock_elems(card, targets, False)
run_amixer('after released', targets)

# The lock is surely released automatically when control character device is
# released. Thus it's safe to terminate the above codes in its middle.
======== 8< --------

[1] https://github.com/alsa-project/alsa-gobject/
[2] https://pygobject.readthedocs.io/en/latest/
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
