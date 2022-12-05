Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 408546430CE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 19:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9447B17F6;
	Mon,  5 Dec 2022 19:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9447B17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670266474;
	bh=Ml+HX8DB2lQBiWAIeo64DP+tcHl3NGP6surFqivK7hU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYmBlPmqX6cskHOdUybzww9CgOli1BTuIP4GKcy5MWZJGUwGLTpuleCcpj0b+tSBM
	 uO6ILEVpeSoQlOTH5Dq5lzWFFyAoo0fzWrsU1PfmZ0Uowcj8R82ht2Vqdf1S10X+oh
	 nviBJSn6jUEOODqx2Fo8TvQ/+TWYJXjFdDi1FpNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B003F8047C;
	Mon,  5 Dec 2022 19:53:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 600B6F80236; Mon,  5 Dec 2022 19:53:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18A7BF80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 19:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18A7BF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=carlh.net header.i=@carlh.net
 header.b="rZpDEaR5"
Received: from main.carlh.net ([164.90.213.35])
 by smtp.hosts.co.uk with esmtpsa (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim) (envelope-from <unknown@carlh.net>) id 1p2Gam-0000yf-DM;
 Mon, 05 Dec 2022 18:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=carlh.net; 
 s=rsa1;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject
 :cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=grJoWJXT2NiMzjRZ6Az2+hb5SjpSQ25BxAVg6RwDSQs=; b=rZpDEaR5shvxpAHVEhcdsBCOJc
 YyRoMgCjUP+tgjLsVE0ZN1cxgqF0YC5Geci4auCJNIPQSHeNRDY7D7mLLReZy8lXqEfjgL70L9aZu
 T/UU7WBpUprmz3xaMLxyFLal5r/8iDP5xZ2tPZpJgOPKCalMBjPfbbIYuqYxsjnaFPjUNexc+GrNY
 474+Z6zQdUSNz25/UdgNBgT9i+uYFVv6dgI1HL6cUely7vYuhWS6WOAN2cTK3x+XsPDr/RD+QKz3M
 Yw1hyOdqA+U8Z9hBObhZ0mM2OxpZrZUz1jWujySyTEiE4FdLPb+QHwuqCsyS0xPE2rOv96yKyc0wL
 ZKsdLG0Q==;
Received: from carl (helo=localhost)
 by main.carlh.net with local-esmtp (Exim 4.94.2)
 (envelope-from <unknown@carlh.net>)
 id 1p2Gak-006STP-91; Mon, 05 Dec 2022 18:53:26 +0000
Date: Mon, 5 Dec 2022 18:53:26 +0000 (GMT)
From: Carl Hetherington <lists@carlh.net>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Query about xrun on usb/pcm
In-Reply-To: <87lenmm3m3.wl-tiwai@suse.de>
Message-ID: <5145ccb-4845-17c3-cac9-3dc4dadf5ec3@carlh.net>
References: <b4e71631-4a94-613-27b2-fb595792630@carlh.net>
 <87y1s3v4ba.wl-tiwai@suse.de> <e830ee7b-e79e-54fb-a2ca-ffffd777b3f@carlh.net>
 <87edtv6pi6.wl-tiwai@suse.de> <baa6589-184f-6751-71be-1d5d67f8a6d5@carlh.net>
 <87fse2qk51.wl-tiwai@suse.de>
 <18aa8f93-92c7-eea-101f-8982292b6e18@carlh.net> <87cz93o9ab.wl-tiwai@suse.de>
 <656d9d2-a0ec-7a3-394c-7a84b17afa11@carlh.net> <87lenmm3m3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam_score: -1.9
X-Spam_bar: -
Cc: alsa-devel@alsa-project.org
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

Hi Takashi,

> I'm going to submit fix patches and put you to Cc.  I believe that the
> former patches are also valid, although it doesn't influence in your
> case, so they'll be included.
>
> The fixes will be likely included in 6.2-rc1.

Thank you, that is great!

I should have mentioned before that I actually tested the patch against
5.15.48 (where it doesn't quite apply cleanly).  Sorry for the
confusion.

If it would help to test against a newer kernel, let me know and I can
give it a try.

All the best,
Carl

