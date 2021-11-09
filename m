Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E352344B484
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 22:14:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6816F1616;
	Tue,  9 Nov 2021 22:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6816F1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636492441;
	bh=JwxSJQ+wDf8t+ixhLC7QsSQAFA2/GFfGbMuG3w0rzuc=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rqZ8Tb0rMYYrsLrAK2RABRkHpHB8Zbh1EL6S75ZjoWKLInX6I7l23W7Cxh0lTCH3L
	 OpODEufG5rFVm2/FWJQ+fIAI/BQUXRe2EB4vrYMJ7oKzkKr2JUQ5XbRUz8R1TeFfBQ
	 dxuBKa69eDEe9doE6oGxJa1Sp9Libfz5p/L6QAKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0729F800C9;
	Tue,  9 Nov 2021 22:12:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEA66F800C9; Tue,  9 Nov 2021 22:12:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9479F800C9
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 22:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9479F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.b="Ilujes3g"
Received: by mail-pf1-x429.google.com with SMTP id g19so565749pfb.8
 for <alsa-devel@alsa-project.org>; Tue, 09 Nov 2021 13:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version;
 bh=vqVAELOd0pU+emufcW1IgO0ANyYT+QjCAQJp7D10Ays=;
 b=Ilujes3gnSJvdUzzhdIYD2sTEt/ajBfROHgkEzNfEoGz0MQKFMMVzSkIspCtxRqCa0
 w9kHu8X/kikwZszAMw9iXLBpqTB9E1jg8G3oVFXp4X0vEyWR/NI6J4iIVp9dNlt4eY20
 XyGoiTniNseCVWWAZy6MHu6xJJnrdisVDkmpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version;
 bh=vqVAELOd0pU+emufcW1IgO0ANyYT+QjCAQJp7D10Ays=;
 b=P18rj4shSdrjIz5p4zxcR8PfydV9JJtEk1y9wtWoe3xNQtncCvCojaoxYUcP5W2ax6
 ag3XnNjCKIhCDfWrLTd9F2L6iejaKbJazjEQJb/BNq+kJ1J+I/n5QMf/BCh4XqUYYbUs
 RKj6y+Z39qtyLgglyns+TZXLXemmB4C/O0ijf4yReJrHbUJiK5jJQZVmyXKUFyKGRrBU
 HuZDd/2/2J2FAUdN3BJsKkfl4Sj//deLqneoTmYchGlR+9LIgG8PQf3I9AgNSi3PGVY6
 M19sU5mY8fQ0gFhAKef1fh4vDzyu38Zp/e/f8FXk3hCflibOZntaP3+CRCHhMCzk832V
 YnKQ==
X-Gm-Message-State: AOAM5304H5oofRJfc09I7xVWQbpFVaY+VWi3fK2zun2F5feQeLgQGy+B
 sRUM1NQmg45HgPifROIsMkYnkA==
X-Google-Smtp-Source: ABdhPJzprsDF+uVfzck4LU3NQX9iOcBklFHAdnbBKepMtT6P1n3b7xv51GV06o1yN1QJ3wkSKuElDA==
X-Received: by 2002:a63:854a:: with SMTP id u71mr8276250pgd.428.1636492353886; 
 Tue, 09 Nov 2021 13:12:33 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id w3sm17599870pfd.195.2021.11.09.13.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 13:12:33 -0800 (PST)
To: perex@perex.cz, tiwai@suse.com, ranjani.sridharan@linux.intel.com,
 broonie@kernel.org, kai.vehmanen@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 regressions@leemhuis.info
From: Scott Branden <scott.branden@broadcom.com>
Subject: 5.15 Linux Regression in sound hda
Message-ID: <063e2397-7edb-5f48-7b0d-618b938d9dd8@broadcom.com>
Date: Tue, 9 Nov 2021 13:12:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000075155105d0619138"
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

--00000000000075155105d0619138
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I'm reporting a new WARN_ON in sound/hda/hdac_bus.c that was not present 
in 5.15.  Sorry, I don't have time to bisect this right now but report 
is below.

dmesg in 5.14 kernel was:
snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 0xffffffffaa2ac520)
GACT probability on
Mirror/redirect action on
Simple TC action Loaded
u32 classifier
     Performance counters on
     input device check on
     Actions configured
hdaudio hdaudioC0D0: Unable to bind the codec
hdaudio hdaudioC0D2: Unable to bind the codec

dmesg in 5.15 kernel produces WARN_ON in sound/hda/hdac_bus.c
snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 0xffffffffad8b02a0)
GACT probability on
Mirror/redirect action on
Simple TC action Loaded
u32 classifier
     Performance counters on
     input device check on
     Actions configured
snd_hda_intel 0000:00:1f.3: Cannot probe codecs, giving up
Initializing XFRM netlink socket
------------[ cut here ]------------
NET: Registered PF_INET6 protocol family
WARNING: CPU: 14 PID: 186 at sound/hda/hdac_bus.c:73 
snd_hdac_bus_exit+0x40/0x50

Segment Routing with IPv6
Modules linked in:
CPU: 14 PID: 186 Comm: kworker/14:2 Tainted: G          I       5.15.0 #1
Hardware name: ASUSTeK COMPUTER INC. System Product Name/WS C246 PRO, 
BIOS 1401 08/13/2020
In-situ OAM (IOAM) with IPv6
Workqueue: events azx_probe_work
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver

RIP: 0010:snd_hdac_bus_exit+0x40/0x50
NET: Registered PF_PACKET protocol family
Code: 75 19 48 8b 57 58 48 8d 47 58 48 39 c2 75 1b 48 81 c7 f8 02 00 00 
e9 ff 97 57 ff 0f 0b 48 8b 57 58 48 8d 47 58 48 39 c2 74 e5 <0f> 0b 48 
81 c7 f8 02 00 00 e9 e2 97 57 ff 66 90 0f 1f 44 00 00 41
RPC: Registered rdma transport module.
RSP: 0000:ffffa545007b7e88 EFLAGS: 00010202
RPC: Registered rdma backchannel transport module.

Key type dns_resolver registered
RAX: ffff89f483078880 RBX: ffff89f483078828 RCX: 0000000080200010
RDX: ffff89f4830792f0 RSI: 0000000000000001 RDI: ffff89f483078828
RBP: ffff89f483078e70 R08: 0000000000000000 R09: ffffffffacf094a4
R10: 0000000000000004 R11: 0000000000000032 R12: ffff89f7dbda50c0
R13: ffff89f7dbda9100 R14: 0000000000000000 R15: ffff89f7dbda9105
FS:  0000000000000000(0000) GS:ffff89f7dbd80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000194a0c001 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  azx_free+0xba/0x170
  process_one_work+0x1db/0x380
  worker_thread+0x4d/0x3e0
  ? rescuer_thread+0x370/0x370
  kthread+0x124/0x150
  ? set_kthread_struct+0x40/0x40
  ret_from_fork+0x1f/0x30
---[ end trace 9779b9e2ef53104c ]---

--00000000000075155105d0619138
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
cRe0CRXA7ypOJSgxO/nOOyQoaJxT7CGg1npOeSpPjEuc3fE4xum3l0nvU85hj6MlKZu43hokdBh0
D0nLyyhEwlR3AC/msdff/UGbM/JR9vk812RP4m/aNWZFJwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUOhjEpl04Sz9dh5MI82E1
V39lM/owDQYJKoZIhvcNAQELBQADggEBAA7Rlypx/esz/iq1yA4+KW7uwV/aBY344BWcXt6I+SNK
VwFBgFWfLj5vaEud9TVv2fPSiaHJo0umemOJk+43QD+bsoqmgcFXd21PrOt7Jjs+jjVED9VC5kJq
S4NNKUkS+BqijJwSegtVygrc/atrIlJbjI21q4qpemUo5fgwqCNm++BmBGTI8yA09vtGSNDRN42k
lLX9hl3iEj5SBgkQqCbbnoE+ZjjKfqt7ED166WhgyQWNrl39yLcvLj+JRUB3RuvXKZjH0NQEEBII
wZBDSkyneykLt3CBNIhSCTxKM6OWxVp936ALSa5K9FNy00TeWSpokR6NmzaW8VD/EjTgvqAxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgx9oXSJpKniO4dS
Gk8wDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIMlaGJQ98My+aAyIZkRbjfzF8l5V
BHiMRyFPu5n1uUY/MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIx
MTEwOTIxMTIzNFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAzFGaAwtFi4IWeG4iu0cwy+C7DQbmHShePv+t6enQ8ulRN
w17SnDTVkU+FaZqvL22862pPUq1OPuJ56yjGbKAmgCtPNiR1ByTSmN411RePCOz+txa5X6KkRhjQ
2tD5ai2HJMWHWBcKIE1LwMllwkbKMzGYnxwra6/ta4hs8f1d7cgPpX43QoLdZCvb5kuyjPbNO0H+
N8kmvvtBvU+JItpcsQ816HWUIrpA+3Kcn728dGOjswawN+lnbnUX/5w2LrqlFmaWx2kCW/9JF4fK
poCbqkgWcfykhVRfPNAN02acmKRzxJ+EWL8m/Ewhu990unLvgKGROs/jWJMA9hPJoyqg
--00000000000075155105d0619138--
