Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD962601B2C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 23:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 774878B38;
	Mon, 17 Oct 2022 23:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 774878B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666041642;
	bh=kCMnB2StDWgmyt+xbgtvPiSAAx09Ii4Ova91zpT/2U8=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i94hnUheNfD0F72rPe1u3maHZ/zO63Iv5rXskcfcpq723oZoS4AYXD07G8xUgSkFU
	 vb3TXhJUdGqvhr8ufvmvmaFNk/Nd+hpp3BzWCYAdc8MYdBxCYkahmCEOiRipd/Hgca
	 jCkcToNhbKs3kgNoMTCzDMw3ujyAtPlC9+WqgOkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02F02F80496;
	Mon, 17 Oct 2022 23:19:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77072F8025E; Mon, 17 Oct 2022 23:19:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mailrelay2-2.pub.mailoutpod2-cph3.one.com
 (mailrelay2-2.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:407::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAA9AF80149
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 23:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAA9AF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=berginkonsult.se header.i=@berginkonsult.se
 header.b="N/yMBQyr"; 
 dkim=permerror (0-bit key) header.d=berginkonsult.se
 header.i=@berginkonsult.se header.b="aqjxUf3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=rsa1;
 h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
 message-id:from;
 bh=+olXPR6CU+w/f4iS4RcGG4InAlp/pvMQeNcgsKrCoRE=;
 b=N/yMBQyrjHZdt/n/XKWI3dgaoPGIiG+RC7yydzn8yaRbkF2Dbl7VRD3xufYnkLYuueCQZGYsP2GhJ
 8KUWzu+1VN+uNfiaVgYS9dTvU2gAgvAY67yt75QaGHJ6Ibca2/o1ceEsM3j9U9psK4Cu7joFeDlQo8
 ucoHcad5JAXGOVQ+YJL4hEnxZ4Fi/OB6Va/ZLusMwnPmabS8l+xCpoW9vTK7tljLrlmnJteviAbxrk
 FZzOhSCBzI30yWsUKaB5le8xAxUkeOOFx9Cmnk5GAXFSNJOht0UgXS6qiN/3dSRbZyfQoAddM4lRg7
 xV7dLR1UIy0BwXE/Nx2kD/AlufTWqFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=ed1;
 h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
 message-id:from;
 bh=+olXPR6CU+w/f4iS4RcGG4InAlp/pvMQeNcgsKrCoRE=;
 b=aqjxUf3drRs6ox5QRMHT4OMFgJdUatnVCoBAuRiB+VZ2ZxwN3HHifBZzg/QfK3W/bTwL838P2CC5d
 KVuYqtvAQ==
X-HalOne-ID: 69170662-4e61-11ed-bb7d-335755252108
Received: from [192.168.100.228] (ua-213-113-159-147.bbcust.telenor.se
 [213.113.159.147]) by mailrelay2 (Halon) with ESMTPSA
 id 69170662-4e61-11ed-bb7d-335755252108;
 Mon, 17 Oct 2022 21:19:41 +0000 (UTC)
Message-ID: <a6942bb9-5a86-e282-9474-40a42ba8feab@berginkonsult.se>
Date: Mon, 17 Oct 2022 23:19:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Peter Bergin <peter@berginkonsult.se>
Subject: cs42xxc-i2c: i2c device and driver not connected through deivce-tree
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

on my system I have a cs42448 chip connected on a i2c bus to a i.Mx8mp. 
The chip is connected on i2c-2 with address 0x48 and I can detect it and 
read registers with help of i2c-tools. Running kernel v6.0 and having 
problem as the device and driver is not connected in my system. The 
probe function (cs42xx8_i2c_probe) is never called during 
initialization. The module is loaded in the kernel.

Here is a snippet from the dtb file:

     codec: cs42xx8@48 {
         compatible = "cirrus,cs42448";
         reg = <0x48>;
         reset-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
         #sound-dai-cells = <0>;
         clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
         clock-names = "mclk";
         VA-supply = <&reg_audio_pwr_5v0>;
         VD-supply = <&reg_audio_pwr_3v3>;
         VLS-supply = <&reg_audio_pwr_3v3>;
         VLC-supply = <&reg_audio_pwr_3v3>;
     };

Tried to dig in to the code and understand why the device and the driver 
is not connected with each other. I assumed that they should be 
connected through device-tree.

In sound/soc/codec/snd-soc-cs42xx8-i2c.mod.c:

MODULE_ALIAS("i2c:cs42448");
MODULE_ALIAS("i2c:cs42888");

So there are no alias to of: in that file.

Do I have the wrong assumption about connecting the device with the 
driver through the device-tree? Something wrong in my dts snippet above? 
Great if someone could help out with some ideas around this.

Thanks,
/Peter


