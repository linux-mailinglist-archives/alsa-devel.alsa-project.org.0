Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12F296B62
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 10:46:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B3BB17F3;
	Fri, 23 Oct 2020 10:45:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B3BB17F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603442801;
	bh=B/kFCiDOB7YoYwaC+40aNTXdynI7Wd3pIW3dJheWALE=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fl4Pi7FoiBwGtHHNNATE/k/2LCeiQqstRmOlWE4W46sqw9otDnM1qExDODye/OW/O
	 vx4PgDXqU2b3ulixpSAIl+dx0Y7gidwpALIXVTRbORkj6jgg58myqtwim23c4uq2cM
	 23iregv/y4BW7WQILGev+Qrej8w4F88r3DDiZSiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D492CF80264;
	Fri, 23 Oct 2020 10:45:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8724FF8025A; Fri, 23 Oct 2020 10:45:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 662E1F80247
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 10:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 662E1F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net
 header.b="eqnLhk/R"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EvVPuBNi"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7CBE25C0150
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 04:45:01 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute1.internal (MEProxy); Fri, 23 Oct 2020 04:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 arunraghavan.net; h=mime-version:message-id:in-reply-to
 :references:date:from:to:subject:content-type; s=mesmtp; bh=5Fao
 fCvW3YsL/KADdh8wtEsakIw8usGrb6un8wzmFSo=; b=eqnLhk/RhQQai/yF/Yfa
 c5P3hbcYtbTJNns7E4eG13vgt6x92ZSQIa+DW0lyViHq4NHYjQDMzZSa2t/t1D4G
 UzBHL25lTr7LIk4G7igftMPPMOSdO+PBdyMo7yFRcTBgCMV+/ewqmjJ9f0MymPne
 lK3ukGz9C0+rw/TdQggXlZs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5FaofC
 vW3YsL/KADdh8wtEsakIw8usGrb6un8wzmFSo=; b=EvVPuBNilw4M4FcX/Cc/s5
 gPgDDE7nvxYDHEnPwoPeRwjGs7bJDEhuDZlctBKIlx6v5Nq7WrD+4BMtIYDNjgXc
 XjSPlHfkmKVKJNmE/eKvXdiiULCetmKiD08u2iv22FVkxhtwIm1D5NBt7RLpyB2Y
 mBQPyGS7U4fP1VakhubezuZ+5wx6YJBw+xbhJlV2Efj0NMocSzhvch3McpIYEito
 8dgwWXt6u8pG2Q3X8mTQ6wkXASQDkW5KPt5uOD2gwSxRLaDc+EUScW9/m8ZPXvNN
 6SSycCPg2oU3+pJHdqKcU4sO/1OpKgzNGGQvfQ2KzLrdsu6MAesRCrXbmrc+Wnnw
 ==
X-ME-Sender: <xms:DJiSX3ZAaelZEG2NPAO2iA39cxUUcuVqqTbW3cbRXLBLQq2BrEoLQw>
 <xme:DJiSX2aSePpSfkA1G3m9mcFmjJe9H1Bz3GgM4evo-2Fgcr2sKFOd-mYE7dtzAMCRA
 ba8AMJ3ICR2ZbF10g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkedtgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdetrhhunhcutfgrghhhrghvrghnfdcuoegrrhhunhesrghr
 uhhnrhgrghhhrghvrghnrdhnvghtqeenucggtffrrghtthgvrhhnpefhgfdtvddvveelte
 ffffejgeelfeegheeuvdeviefhvdeuhfduhfeitdehuefffeenucffohhmrghinheprghl
 shgrqdhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvth
X-ME-Proxy: <xmx:DJiSX59RRlqsNcYMoEV4cx8DO7WSmhJhaad9yEM-iwSA-OYwUsofDw>
 <xmx:DJiSX9oGvQIVRm3dHruZqO7qEbRQZcp3oenrqDnGOd1PLCUl9LFaVA>
 <xmx:DJiSXyqL35fnemS7klyIcD0fIoeISQ-PA3FBCP8O4uxFwDXKIVNL2Q>
 <xmx:DZiSX_0D-ZxQgkK6FDBCWpahM8QL1uCKmXe0bM1846R__tOBtA3x4A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 263FD660069; Fri, 23 Oct 2020 04:44:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <1187b404-ee9f-47ae-90f6-032fb4a23849@www.fastmail.com>
In-Reply-To: <5ba74317-1cc0-80ae-44d9-e9f24c065968@perex.cz>
References: <CAA+gEba8Q+KgZbao+ur2roSpxbwRAQcshbfR6ZQCAr6cXLq4JA@mail.gmail.com>
 <5ba74317-1cc0-80ae-44d9-e9f24c065968@perex.cz>
Date: Fri, 23 Oct 2020 04:42:40 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel mailing list / gmail] Re: Excessive bounces
Content-Type: text/plain
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

On Thu, 22 Oct 2020, at 4:03 AM, Jaroslav Kysela wrote:
[...]
> Unfortunately, I cannot do much here. I can assist to fix the issues, but I
> need to know, what I can improve. I suggest to use another e-mail service. It
> seems that google does not care about users now. Or you should ask them what's
> exactly wrong.
> 
> The current postmaster.google.com stats for alsa-project.org:
> 
> User reported spam rate - 0%
> DKIM, DMARC, SFP success rate - all 100%
> Encryption - 100%
> IP reputation - bad
> Delivery errors - 40% - 100%

FWIW, GMail's handling of mailing lists is horrendous enough that I dropped it for more or less all mailing lists. I saw lots of legitimate emails from alsa-devel and gstreamer-devel go to spam.

-- Arun
