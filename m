Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D6449851
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 16:31:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 228AE165D;
	Mon,  8 Nov 2021 16:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 228AE165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636385504;
	bh=mdku1CktX2MFcg4ZOs0mwda/97VKaRth+QBSa39V3l8=;
	h=Subject:From:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y4l+hI3CxRy0GKk6n+awiliq8yleW3FtSPgk4Vb7J0Stq06DBwuRo0WugNETJKwEa
	 PNHMiDdTML113wPdDFjLqczDe2JnZRCDiXvVn++VGh/O7+dZmUipQu8AZuETUXIFwf
	 U0d48RlyCjhZQ06gECNxw2nKpbL0zhptzFSQcMtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77214F801D8;
	Mon,  8 Nov 2021 16:30:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32EFBF8049E; Mon,  8 Nov 2021 11:00:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.6clones.net (mx1.6clones.net [45.13.104.109])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6BC1F8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 11:00:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6BC1F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=toniob.net header.i=@toniob.net
 header.b="smEyHwDN"
Received: from [192.168.0.196]
 (aaubervilliers-654-1-22-59.w83-112.abo.wanadoo.fr [83.112.249.59])
 (Authenticated sender: contact@toniob.net)
 by mail1.6clones.net (Postfix) with ESMTPSA id AFC4A800AC
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 11:00:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toniob.net;
 s=dkim6clones; t=1636365647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mdku1CktX2MFcg4ZOs0mwda/97VKaRth+QBSa39V3l8=;
 b=smEyHwDNy/wgLU9ksrAwOvuJZ2sV3jYiQi3jV7Vf1kjOiSvgIDB+p2uIpJ8SeZGoVzCXkF
 R95IraYoEPRzGn3p+So0Zto/6hdwBgGkKtxGgAJjQEB7T8LtDG/kB1MXLF3/akiX5URql5
 2ImhrWxVIisJXrzjEtp9vk4aRO5u8FrZXH289I3F09BJzMf87ywOypKe4JU2byS+o/Ke0H
 4/fJ6aErhyfs4uaY7m7Qt8nJXMXxgBwLjopjGJ8IJJJPtItrtOkDD7whvzmUraTUOD59EJ
 3KXu5iOzg2/qvpXpeF+T4JnOni7PCZdlL1ZnTSsiFAZaOTu+P3R1pHKwO3ihCg==
Message-ID: <53c198506f64484aa643073a5fe780d13957e89b.camel@toniob.net>
Subject: Support TC Helicon GoXLR
From: Anthony Bourguignon <contact@toniob.net>
To: alsa-devel@alsa-project.org
Date: Mon, 08 Nov 2021 11:00:38 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: mail1.6clones.net;
 auth=pass smtp.auth=contact@toniob.net smtp.mailfrom=contact@toniob.net
X-Mailman-Approved-At: Mon, 08 Nov 2021 16:29:17 +0100
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

Hi everyone,

I’m the owner of a GoXLR : https://www.tc-helicon.com/product.html?modelCode=P0CQK . It is a usb sound mixer that is not supported officially with
Linux. The main issue is that the GoXLR is a multi inputs / multi outputs device, but it is not seen as one. It works great under Windows thanks to a
driver. With Linux, it is seen as a single usb sound device with a single multichannel output. Right now, I managed with other people to separate
those channels with pulseaudio or jack or even pipewire. For exemple, Front Left and Front Right are the stereo output named "System". Rear left and
rear right are another stereo output name Game. There are other outputs, and it is the same mechanism for the inputs.

But I’ve seen that a few usb devices do have quirks for them to behave as expected, without the need of configuration with pulse or pipewire. But from
what I understand, it’s only to disable subdevices or reorder outputs. Am I wrong ? Is it possible to add a quirk for a device like the GoXLR and
change the multichannel output into multiple subdevices with alsa ?

Thanks a lot if you can help me and the others owners.

Anthony
