Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 866822A02D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 23:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176A4172F;
	Fri, 24 May 2019 23:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176A4172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558731674;
	bh=x1drxBB0r86CFBGE2EhlvQxnwAffkLXVzKuS6yRN+Fc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SQkOmPpbVB/cOEFU70tM6ZWrUJ4P++Ylf1PabTOPrKPwrCiDPJrPTYQ14wRLy/XEq
	 UaDyui3Cqo7hDHHbqBTAgSa+wcdBzLYm5GqGyifSh6c0fjXEQJQuIdN5eMth/i75kn
	 MFsQ7/Kuw+jUn3VUebTFnXCN344622vxQgdSBGGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B556F89636;
	Fri, 24 May 2019 22:59:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11A9AF89630; Fri, 24 May 2019 15:54:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_135,RDNS_NONE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from smtprelay-out1.synopsys.com (unknown [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951ECF80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 15:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951ECF80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.b="UMkE/UAT"
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 00AF8C0152
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1558706093; bh=Z8/Wm1wrJUDoJWWGKc64L6kVw8oVD7IThI2PzxpfA0M=;
 h=From:To:Subject:Date:From;
 b=UMkE/UATqC5yclwGd9tZSxZQln9fRkJ8ZXk24lx1UYGl0dOupZz2b4K6/6rrUzbl2
 DuUyxgBjcVO4kdKZlndklvpKJeM1tIsR8aG/W1/lmPA8R+MizlI6eHvHvzS9XfpCXy
 uGjh0fKT8/F2vlQ5ZbJuG7tHwHm25b6QQ2qqgrgt7i3UAefocQ0CTX1hlCoe+ECXa7
 JfJGFeqJ5Tmi4I2eRxIUFQ02tqq5KakXVpCSszN20VBQmOgI6bzIBozpUc2pz5bj9V
 dA0NY1A4jvPoCTl3h8hG4l4uIkCAzbm9VsjYh9rnpn0QOjSJdFaIToVbb5xR8wvFgb
 HMqiNabg3kehw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 998C5A0076
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 13:54:43 +0000 (UTC)
Received: from IN01WEHTCB.internal.synopsys.com (10.144.199.106) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 24 May 2019 06:54:43 -0700
Received: from IN01WEMBXA.internal.synopsys.com ([fe80::ed6f:22d3:d35:4833])
 by IN01WEHTCB.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000; Fri,
 24 May 2019 19:24:40 +0530
From: Aditya Paluri <Venkata.AdityaPaluri@synopsys.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: arecord doesnt record into file
Thread-Index: AdUSN6GuKaXPnosLQEeMMo7xSoCplA==
Date: Fri, 24 May 2019 13:54:39 +0000
Message-ID: <83B5A2EBEFF68E46AB106DA39CB25921010ED695@IN01WEMBXA.internal.synopsys.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXHZhZGl0eWFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy03ODUxODBjNi03ZTJiLTExZTktYmY5OC04Y2VjNGJmZDVhZTNcYW1lLXRlc3RcNzg1MTgwYzctN2UyYi0xMWU5LWJmOTgtOGNlYzRiZmQ1YWUzYm9keS5odG1sIiBzej0iNDkwMSIgdD0iMTMyMDMxNzk2NzkwMDkzNTYwIiBoPSJ5Q05iczhpSVUzVTRhT0ZHb2hIcXg1Tnd3eUk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-originating-ip: [10.144.141.15]
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 May 2019 22:59:26 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] arecord doesnt record into file
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

Hello all,

I use the below command:

arecord --device plughw:0,2 -r 48000 -f S16_LE -c 2 recorded_sound.wav

And as I see the audio stream getting dumped onto the DRAM/memory, I donot see recorded_sound.wav contain any data on the file system.
I have tried to use strace and I could only see "write" system call happen on the file only for writing the wav format header.

ioctl(4, _IOC(_IOC_READ|_IOC_WRITE, 0x41, 0x23, 0x88), 0x1ec27190) = 0
newfstatat(AT_FDCWD, "/home/root/recorded_wave.wav", 0x7fe8bfeb50, AT_SYMLINK_NOFOLLOW) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/home/root/recorded_wave.wav", O_WRONLY|O_CREAT, 0644) = 3
write(3, "RIFF$\0\0\200WAVE", 12)       = 12
write(3, "fmt \20\0\0\0", 8)            = 8
write(3, "\1\0\2\0\200\273\0\0\0\356\2\0\4\0\20\0", 16) = 16
write(3, "data\0\0\0\200", 8)           = 8
ioctl(4, _IOC(_IOC_READ|_IOC_WRITE, 0x41, 0x23, 0x88), 0x1ec27190) = 0
ioctl(4, _IOC(_IOC_READ, 0x41, 0x51, 0x18)[   24.145583] [   24.587069]  [0


I also see EPIPE error due to overrun.

, 0x7fe8bfeaa8) = -1 EPIPE (Broken pipe)
ioctl(4, _IOC(_IOC_READ|_IOC_WRITE, 0x41, 0x24, 0x98), 0x7fe8bfe9b0) = 0
write(2, "overrun!!! (at least 0.717 ms lo"..., 36overrun!!! (at least 0.717 ms long)
) = 36

Could you please help me in understanding why the recorded_sound.wav doesn't contain any data ?

BR\Thanks.
Aditya Paluri.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
