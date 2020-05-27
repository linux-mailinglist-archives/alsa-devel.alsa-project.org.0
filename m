Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE9C1E39AD
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 08:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F2BC179B;
	Wed, 27 May 2020 08:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F2BC179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590562388;
	bh=2qpOukN+r2zz5WUIyCJIdytnKDhKoJOFuvO6vXYx5VQ=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DqEJP4lYR5DxK0O01SnSL1x2nMo8LHnGRrrU+9h5GwsOE8FXZZLnfjieG8eVdhcro
	 u51k8rNUUDMJUqO9lBd0udWLWcDlvtBXN2i0JlFrcmxfYaUaLOLo9u7rUL/Kj2X1Er
	 uKRxNZ1KY7uAhlhZg7LJmhltLGswQkAAqnQsXlFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5273AF8014E;
	Wed, 27 May 2020 08:51:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24317F8014E; Wed, 27 May 2020 08:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [IPv6:2a01:4f8:212:88::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6F9CF80146
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 08:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F9CF80146
Received: from [10.1.2.92] (unknown [94.101.37.79])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 1329E5C6502D
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 08:51:16 +0200 (CEST)
Subject: Re: Alsa Midi Driver Question/Issue
To: alsa-devel@alsa-project.org
References: <770a8eb1beaf66e2ac4d3f12e42adda5@grossmann-venter.com>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <55e62133-e616-8d1c-5635-ba2532143331@ladisch.de>
Date: Wed, 27 May 2020 08:51:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <770a8eb1beaf66e2ac4d3f12e42adda5@grossmann-venter.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.101.5 at webclient5
X-Virus-Status: Clean
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

liebrecht@grossmann-venter.com wrote:
> Bitwig absolutely requires to have exclusive access to a USB pad Controller

ALSA has two MIDI APIs.

The low-level RawMIDI interface gives low-level access to the raw bytes
going over a port, and usually allows only exclusive access.

The sequencer interface deals only on messages, allows user-space programs
to create their own ports, and allows multiple connections per port.  When
a sequencer port corresponding to a hardware port is opened, the RawMIDI
port is also opened and thus blocks other accesses.

Apparently, Bitwig uses the RawMIDI interface.

Try loading the snd-virmidi module (which creates a virtual sound card),
and tell Bitwig to use that.  You can then connect its sequencer ports
to whatever hardware or software ports you like.


Regards,
Clemens
