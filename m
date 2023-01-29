Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEA968001A
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Jan 2023 16:54:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2225A84B;
	Sun, 29 Jan 2023 16:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2225A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675007693;
	bh=wRKlzLdup8jq63YLyCL4fm6uQTG/7e4WBP4+o6TwvBg=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fZ5vkFWCNwcBFnkPk+yOd/B4yOLZJihTl6yJpK0ES4jcmGPLxVKV98cWIswdqVcVi
	 dk3sk3jaARqmrS8Nef1ISCvw+LMtH2UDw1vmDPAgNuXenQg+zkgd7sfwbjXz8Ucc3x
	 Ir3VWQ3yyNcKXN7K2QDfOobsl/DUIxnwewE7fiKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79EDBF80155;
	Sun, 29 Jan 2023 16:53:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 870DEF804B2; Sun, 29 Jan 2023 16:53:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from 2.mo552.mail-out.ovh.net (2.mo552.mail-out.ovh.net
 [178.33.105.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 720ACF8007C
 for <alsa-devel@alsa-project.org>; Sun, 29 Jan 2023 16:53:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 720ACF8007C
Received: from mxplan2.mail.ovh.net (unknown [10.109.146.28])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 688AA27475
 for <alsa-devel@alsa-project.org>; Sun, 29 Jan 2023 15:53:44 +0000 (UTC)
Received: from gnuinos.org (37.59.142.110) by DAG5EX1.mxp2.local (172.16.2.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Sun, 29 Jan
 2023 16:53:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00452f60c98-3a68-4c92-9daf-66caf81a4558,
 05BB96B847A8C1366371E7DF300F641C8D2E5AED) smtp.auth=aitor_czr@gnuinos.org
X-OVh-ClientIp: 88.11.110.122
Message-ID: <18cfeb79-1a35-332b-d526-05a68cbee28f@gnuinos.org>
Date: Sun, 29 Jan 2023 16:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: <alsa-devel@alsa-project.org>
From: aitor <aitor_czr@gnuinos.org>
Subject: amixer-gtk
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX1.mxp2.local (172.16.2.15) To DAG5EX1.mxp2.local
 (172.16.2.9)
X-Ovh-Tracer-GUID: f4563c32-68d3-4767-ba5a-ab1d3ae0495e
X-Ovh-Tracer-Id: 10846919706100885015
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeftddgkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpegtkfffgggfvffhufhisegrtderredtfeejnecuhfhrohhmpegrihhtohhruceorghithhorhgptgiirhesghhnuhhinhhoshdrohhrgheqnecuggftrfgrthhtvghrnhepkefgtefgjedvtddvgfehfeeuueehueejvdejveeuhedvuddvteektdetgeefheffnecuffhomhgrihhnpeguvghvuhgrnhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrihhtohhrpggtiihrsehgnhhuihhnohhsrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrlhhsrgdquggvvhgvlhesrghlshgrqdhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

This might be a bit off-topic in a low level mailing list like this (I mean, at kernel level),
but I would like to share with you a new gtk based interface for alsa mixer I'm working on.
I called it amixer-gtk because most of the code in the backend is built on top of Jaroslav's amixer.
If you want to give it a try, just download the git repo and follow the explanations in the README:

$ git clonehttps://git.devuan.org/aitor_czr/amixer-gtk.git

By default, the source will be built in gtk2, but you can change gtkmm-2.4 with gtmm-3.0 in the ui/Makefile
if you wish. Feedback is welcome, especially with regard to devices, cards, and so on... ;~)

On the other hand, one of the reasons I'm writing here concerns the licensing issue. Files like:

https://git.devuan.org/aitor_czr/amixer-gtk/src/branch/master/alsa/amixer.c

https://git.devuan.org/aitor_czr/amixer-gtk/src/branch/master/alsa/events.c

contain a header referring to GPL (either version 2 or higher), and also to Jaroslav Kysela. Is this enough?

Cheers,

Aitor.


