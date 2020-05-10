Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 419241CC7B6
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 09:45:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA5E015E4;
	Sun, 10 May 2020 09:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA5E015E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589096702;
	bh=LWUB7076vqMu0m6r/o5RUjnEW83znKl0kD8FxMxvoeA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jH+D/vypVWWj75EkCOPNx9CwUF1OFd81IlNvuUO6FOH5d3+rSxD+onVp/xpdOF0D5
	 H/TXtbwQ0lGqbP01nq5oObnO3p++OBjKLxIrDxckmbw71s4ActQKGsa+NyU6wU3kAE
	 /8h/E0zAZNHzwWbgL25hv7kFjx3tjwsHKotFcUHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF41F80253;
	Sun, 10 May 2020 09:43:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0955BF8027D; Sun, 10 May 2020 09:43:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 943E6F800B7
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 09:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 943E6F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="M6/4imBI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tVHDai2n"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id D7BBC5C008B;
 Sun, 10 May 2020 03:43:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 10 May 2020 03:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=GDUhZXPT/eAGvL5U1cG30lyfHP
 9vPHvwUKtyOzKZxnI=; b=M6/4imBI3lMFmH2L1cyTXJIfDBG1rcpZ8dM96c7/sR
 GiDe1pBSOT01IMKFCSV5S/RTDH6x6HNhQyug9MTUcpG3NvoYJ+HRcMZCl4LRXHjt
 FshCactvq1SSmpyVx/qoUtMojopfCLeFUNOPYbsqNm+3fLH/ZoU4Ur6WTKOhO+my
 xVUikt30gBAYWyVs7So+2YHjP/ExLbZrRzeiIVnJCOaGS4kdz5FQa3cj+FI5SZjZ
 /twmW0Q7Sjmf/c85Oh3PJNlee7q5G/7UDzMax9VF8jN07V+mXFYzPq+GUu5skdD6
 8I71zcc5jUj9e4Y4HekJyCihHPqHC97Ln4bfDlo+lKYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GDUhZXPT/eAGvL5U1
 cG30lyfHP9vPHvwUKtyOzKZxnI=; b=tVHDai2ncd4pgzk6mMLnk81fhZg9NLsqC
 MZI1XCrsgyzr6vmgjyCEZs9Qw/hDU1yNQqEhCna3qpYgyR0C9cpNEdpwTZGJSQV1
 Zm71IG2etwZ4LNQDCyNZ7EvNWiPgUzVU+paHSd++RSq1WcaOwQ64b0MvI6R0KOpm
 iurD2Yo/HDYIi4AyJd+gkhyP4C9nrj1KdORS19yFzAfSCUjL5IUsSGTFf2tgzlOY
 /+TQwRRMpKsJJ0IwPjELdaa+TfgNzeDjGuWSy8Z8+LreGyVVYIo6zkPVGEvHv9R8
 bXoyEVPLE+aJTPr9FTJvDP/6rTWYxuilFW9ph58vcxyErm6qlzIhA==
X-ME-Sender: <xms:ibC3XgV5Vob-bdRVOurDb6pC_1l-hD8JaUVGEHQzoEfNUDZ42b7mMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeejgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtke
 fgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucfkphepudektddrvdef
 hedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ibC3XmJC1vzrMRbzva2qfIkwzbTAhIv68qAavYan7csynFwzYH01Pg>
 <xmx:ibC3XjrmwJv1nlTvRJeaM7dRDqTnB6oCSHcetI6o1rvAAswJ0wcCnw>
 <xmx:ibC3Xlz0cFSIBikcOAcI2c9l443CXkOdN5xP_A9m3O2jxpckDrwdNA>
 <xmx:ibC3XqhOrIXxZeSoYjAAWDzNPZ1VivC_8Tu-bxo-pvI6v9QaSr-YmQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 29B773066258;
 Sun, 10 May 2020 03:43:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 0/6] ALSA: fireface: add support for Fireface 802 and UFX
Date: Sun, 10 May 2020 16:42:55 +0900
Message-Id: <20200510074301.116224-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net
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

Fireface 802 was shipped by RME GmbH in 2014. This model is one of latter
models of Fireface series and support both of IEEE 1394 bus and USB.
Furthermore, it supports two types of remote control unit (Basic
Remote and Advanced Remote Control) with by 9pin mini-din connector.

This patchset adds support for this model as a part of devices available
by ALSA firewire stack (therefore it's not a device of USB). Userspace
applications can transfer PCM frames and MIDI messages via ALSA PCM
and Rawmidi interfaces.

Fireface UFX is also supported since its internal design is almost the
same as Fireface 802 in a point of packet communication. The support is
untested and the status is 'request for test'.

As well as the other models of RME Fireface series, audio output
includes periodical hissing noise. This is not solved yet.

Furthermore, capture of MIDI messages requires assist of userspace
application. For the detail, please read comment in
'sound/firewire/fireface/ff-protocol-latter.c'.

Regards

Takashi Sakamoto (6):
  ALSA: fireface: fix configuration error for nominal sampling transfer
    frequency
  ALSA: fireface: start IR context immediately
  ALSA: fireface: code refactoring to add enumeration constants for
    model identification
  ALSA: fireface: code refactoring for name of sound card
  ALSA: fireface: add support for RME FireFace 802
  ALSA: fireface: add support for Fireface UFX (untested)

 sound/firewire/Kconfig                       |  2 +
 sound/firewire/fireface/ff-protocol-latter.c | 58 +++++++++++++------
 sound/firewire/fireface/ff-stream.c          | 10 +---
 sound/firewire/fireface/ff.c                 | 61 +++++++++++++++++---
 sound/firewire/fireface/ff.h                 | 11 +++-
 5 files changed, 103 insertions(+), 39 deletions(-)

-- 
2.25.1

