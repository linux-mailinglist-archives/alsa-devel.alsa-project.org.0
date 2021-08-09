Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E333E40D0
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 09:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D76F1167E;
	Mon,  9 Aug 2021 09:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D76F1167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628494128;
	bh=Oj+oap6iOGg1AaMSoSfhRZZRafqontokkcjiXJNyeJ8=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iypqvziabDMe61e0ekXlFP4lryHh9joS/HyG0Ft8brPZl0xGYDiTsu43EDpAdot3A
	 XRi/0ezwlWMv0BjfUYgK5nf4W4MNzYm9rXlhR0iJIxtkHG/PqRuzXG0uYIlhvZC+y9
	 bowdgMTLnYo8Y3AD36/ftTpOORjq/syoM6wIOseM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52B9BF800C8;
	Mon,  9 Aug 2021 09:27:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D66E9F802D2; Mon,  9 Aug 2021 09:27:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9A0AF800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 09:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A0AF800FD
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud7.xs4all.net with ESMTPA
 id CzgnmyiOl4SnACzgomlOb7; Mon, 09 Aug 2021 09:27:14 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 2F7A9161E56
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 09:27:13 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id a-hVmoKe59eP for <alsa-devel@alsa-project.org>;
 Mon,  9 Aug 2021 09:27:12 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 786BE15F96D
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 09:27:12 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id 6FB4D161820; Mon,  9 Aug 2021 09:27:12 +0200 (CEST)
Date: Mon, 9 Aug 2021 09:27:12 +0200
From: folkert <folkert@vanheusden.com>
To: alsa-devel@alsa-project.org
Subject: waiting for a connection
Message-ID: <20210809072712.GL890690@belle.intranet.vanheusden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfLaAsEkHHBycrs9eTufUYahlN8yujezqETK/CZs3BzbVhhoLSrV4I+DWgUzhOGi7xWyVxk3jdCPI3bBDaAVkD1LGw4MF5mlJL1/DTQDknjAGcxFxnMdN
 2jhIYB5kkH+O8kS9prTwaWoYvpfMaYt+CHy7MH5ccYDE+CaUvfu38mfynnCKTIazrzGL8jI8c1rhpy4ESlSGurTChqT+Q5QaboRuiyLyJqRbH5IyX5SgxhJo
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

When I create an ALSA MIDI port, is it possible (how?) to wait for
someone to connect to it/map it to an other port?

This would allow me to only allocate extra resources when needed (in my
case: connect to ipmidi-peer (in unicast mode)).


regards
