Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91293602C66
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 15:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E8BE9D9B;
	Tue, 18 Oct 2022 15:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E8BE9D9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666098392;
	bh=uMV15GNGq+bBCla8aqqcV3BTzDp524uwSjUpY0W6ij0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXuhvZZ1WG4j9ca9C4teY/rSfstlUrAEKO+RIwnEpNjuZk9qZSxGlVffwbxI01N10
	 QY2hMIGxdbU6DSFebkztk0v+FctNm/B6FKv0Vsc2KEEEh3t5pvWOV8sbTBBl0XMXIg
	 VYtWBhjqtiXN0UDqRDa00yikdrvpoDqQu9H7Q6K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B644F8024C;
	Tue, 18 Oct 2022 15:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB7A7F800AB; Tue, 18 Oct 2022 15:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ADD7F800AB
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 15:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ADD7F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=berginkonsult.se header.i=@berginkonsult.se
 header.b="WjL8Ts2D"; 
 dkim=permerror (0-bit key) header.d=berginkonsult.se
 header.i=@berginkonsult.se header.b="+W5AETq4"
Received: from mailrelay1.pub.mailoutpod2-cph3.one.com
 (mailrelay1.pub.mailoutpod2-cph3.one.com [104.37.34.6])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
 id 8b778a78-4ee5-11ed-be8b-d0431ea8bb03;
 Tue, 18 Oct 2022 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=rsa1;
 h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
 mime-version:date:message-id:from;
 bh=EzgrVvz512sK+bJmv9JFWPN3j/JxLKiN5WSN82yqnU4=;
 b=WjL8Ts2DG7PLfeJ0hR69jECzfNXNC0bSC/XCChrBRS/geP580coOlU8y+Lxp22T2vaIGTQ0kXQ7li
 XMH8DBUqi9NdqF+E8CYXNOvR6Cner5EzCLmUTQRkLVevB446jCYOYJAUzfcz78qxaoX7PR/KrD4vRS
 j90EDSo3QQsZVZgQq61XBCEHOT38JRpw0mv1GEepTo285Kz3sha4dpKvVCIq0n5Mg7ZVjxeM0NgjBX
 t5+iaLAHkajNLfuILQLFIgpIAKuF1ig/wZBgXqVx+BCHSo31CGqzrYtaPy3tmzmblpSisg1Wx69TBr
 GcvUrdNB0zIwXgValCttgnLppRC3kaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=ed1;
 h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
 mime-version:date:message-id:from;
 bh=EzgrVvz512sK+bJmv9JFWPN3j/JxLKiN5WSN82yqnU4=;
 b=+W5AETq4Bodo73a0mchgU562Dz4xk8jtxnGCReMYhISsuK9GNIn9dHtGM2hhQzldxFdm+3ghlbKw/
 THufIuMAQ==
X-HalOne-ID: 8a216623-4ee5-11ed-b432-1b2345786432
Received: from [10.11.12.89] (unknown [83.218.73.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 8a216623-4ee5-11ed-b432-1b2345786432;
 Tue, 18 Oct 2022 13:05:30 +0000 (UTC)
Message-ID: <169e4a09-5f86-0e48-af41-6fc6ae42e46c@berginkonsult.se>
Date: Tue, 18 Oct 2022 15:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: cs42xxc-i2c: i2c device and driver not connected through
 deivce-tree
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <a6942bb9-5a86-e282-9474-40a42ba8feab@berginkonsult.se>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <a6942bb9-5a86-e282-9474-40a42ba8feab@berginkonsult.se>
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

On 2022-10-17 23:19, Peter Bergin wrote:
> Hi,
>
> on my system I have a cs42448 chip connected on a i2c bus to a 
> i.Mx8mp. The chip is connected on i2c-2 with address 0x48 and I can 
> detect it and read registers with help of i2c-tools. Running kernel 
> v6.0 and having problem as the device and driver is not connected in 
> my system. The probe function (cs42xx8_i2c_probe) is never called 
> during initialization. The module is loaded in the kernel.
>
> Here is a snippet from the dtb file:
>
>     codec: cs42xx8@48 {
>         compatible = "cirrus,cs42448";
>         reg = <0x48>;
>         reset-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
>         #sound-dai-cells = <0>;
>         clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
>         clock-names = "mclk";
>         VA-supply = <&reg_audio_pwr_5v0>;
>         VD-supply = <&reg_audio_pwr_3v3>;
>         VLS-supply = <&reg_audio_pwr_3v3>;
>         VLC-supply = <&reg_audio_pwr_3v3>;
>     };
>
> Tried to dig in to the code and understand why the device and the 
> driver is not connected with each other. I assumed that they should be 
> connected through device-tree.
>
> In sound/soc/codec/snd-soc-cs42xx8-i2c.mod.c:
>
> MODULE_ALIAS("i2c:cs42448");
> MODULE_ALIAS("i2c:cs42888");
>
> So there are no alias to of: in that file.
>
> Do I have the wrong assumption about connecting the device with the 
> driver through the device-tree? Something wrong in my dts snippet 
> above? Great if someone could help out with some ideas around this.
>
My problem is solved and I can connect device and driver with this patch:

diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index cb06a06d48b0..6e8ee28d01f8 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -37,6 +37,13 @@ static int cs42xx8_i2c_remove(struct i2c_client *i2c)
         return 0;
  }

+const struct of_device_id cs42xx8_of_match[] = {
+       { .compatible = "cirrus,cs42448", .data = &cs42448_data, },
+       { .compatible = "cirrus,cs42888", .data = &cs42888_data, },
+       { /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cs42xx8_of_match);
+
  static struct i2c_device_id cs42xx8_i2c_id[] = {
         {"cs42448", (kernel_ulong_t)&cs42448_data},
         {"cs42888", (kernel_ulong_t)&cs42888_data},

That information is already present and copied from 
sound/soc/codecs/cs42xx8.c. Is this a suitable solution to the problem? 
Something that can be applied upstream?

Thanks,
/Peter


