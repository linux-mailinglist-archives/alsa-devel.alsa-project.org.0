Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA3259E584
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:00:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDFDC1680;
	Tue, 23 Aug 2022 16:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDFDC1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661266817;
	bh=ymNh7/F+w7n/5t4Yw8QjDwgzChW36CUBRknTAnlD06A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B8Q8IikUgu2NlZWmYs4UEjfnc+oErZASgZAVW2AmGfCaZGbAkGwGEDJM71dAU1Vwx
	 o5az6sqndT3X2owGe9OZfM1pNEBKiO9v9cY+Dqf3Sm2NiwZRBFK5lr4MmAGAfwRKze
	 W2dfBREnzs8fQXKqcAbp9aIwBbH9qcMz4gCXAQ+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FECBF80526;
	Tue, 23 Aug 2022 16:58:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D116F8026A; Mon, 22 Aug 2022 22:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BA36F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 22:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA36F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu
 header.b="nBE9yBQ5"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27MKqsLp032108
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 16:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu;
 h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type : content-transfer-encoding; s=pps01;
 bh=eCX3WTo7kOkqh5Nfr0V/r9dCgQOhzMzg/a77cKVHcw0=;
 b=nBE9yBQ5LQGMd28iTLlMC7393JScNQ7e7vSx606XeBuOQf70bNNp3JK0eCZzzvZRtcPq
 PbaQHLwdk4ENeuUSHPFfNyYNR+EHoOAzcVvLrdbSfOwl+sl84N4naV4H0FKz1MrlCafz
 uoPt6LA+VANU4DuN3sdDiChfg8Gra9yROkWyn51KmJF6f1FqAYCOC03qjXuj4Wdp7yoL
 W6cVLDVVQwTzbvPdziqHQX8VNFEO8yUwMi7xER77UPKDKz2nevO/o+9HxYcnI1QIQ2Bn
 HJS6kDn20AQfBYKy26+SWNIi6xlGP4PSC7+cnyuZdSUiqYKV0CyomuOjIPRa2wB4hLyI 7A== 
Received: from sendprdmail22.cc.columbia.edu (sendprdmail22.cc.columbia.edu
 [128.59.72.24])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 3j4gbagdrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 16:55:23 -0400
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by sendprdmail22.cc.columbia.edu (8.14.7/8.14.4) with ESMTP id 27MKtBqZ076800
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 16:55:22 -0400
Received: by mail-vk1-f199.google.com with SMTP id
 f202-20020a1f38d3000000b003802dd3dc36so1979935vka.23
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 13:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=eCX3WTo7kOkqh5Nfr0V/r9dCgQOhzMzg/a77cKVHcw0=;
 b=afR36/dqJZ1LWg4jSYh5Zs3hnulr5yJUSz7h9/Qs6AI6HzbfV+pKdIf+WEMpb5b+Ei
 C6X3eeKhSbzELyBa2e5vSsSojCWPuS7h69DFcjuUIZQXCUAyzI9fgjdsczgM70BykxgR
 Cp83UUgtw81sWsQMzfWnFrrFmAtbRL5AOJUmO019S+uPUGvxN+CPXXzga47iTqteGlXw
 PElBE/9j+qLygvEr5lSsNnYcffq006MQPDqEJCyxbutCZMTfyPlCe2+kFmcDbUHo3so1
 mXZbzVNCfilgCzg+KhQ3luKYwqE9Mllx97BwZEBtiZGGAwyIWutgyqxHRVBVP8OsvFRL
 O9qw==
X-Gm-Message-State: ACgBeo3SVQ9foyUhMYoV7TfXGDhwDj37VbtkKqhhUWlf8vuiFMl4NiEg
 TvyZ/YUTRcmTdisybG2dog5AK3TQ/AS3zmHjBUUtNMMFwO9cEGIswM+hVq4z0P9Ag1QbLhEaQHt
 ng//iEnU2vIhJVl72CNvs8gmCxd0kqKQ2MGDwJgYrwmKXAEo=
X-Received: by 2002:a9f:22e9:0:b0:39e:ebf0:9017 with SMTP id
 96-20020a9f22e9000000b0039eebf09017mr3783944uan.41.1661201721918; 
 Mon, 22 Aug 2022 13:55:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7k0OWE1pqD66f6dyimP+DIHQ11Mbfs1wp3O4lGuNbfSEfb4AZlKLsjRZUq1u2g95pId6JNwPiZQBN8fZv5Akc=
X-Received: by 2002:a9f:22e9:0:b0:39e:ebf0:9017 with SMTP id
 96-20020a9f22e9000000b0039eebf09017mr3783920uan.41.1661201721057; Mon, 22 Aug
 2022 13:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAEHB24_ay6YzARpA1zgCsE7=H9CSJJzux618E=Ka4h0YdKn=qA@mail.gmail.com>
 <87h727mm23.wl-tiwai@suse.de>
In-Reply-To: <87h727mm23.wl-tiwai@suse.de>
From: Gabriel Ryan <gabe@cs.columbia.edu>
Date: Mon, 22 Aug 2022 16:55:14 -0400
Message-ID: <CALbthtdr0OL4XKeezfYjNc7jUuj0-jw5RcvSCsNRj=wUvp0hmg@mail.gmail.com>
Subject: Re: data-race in snd_seq_client_use_ptr / snd_seq_client_use_ptr
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: giEohDLp3BjJHhky9czkQWtjDFSG5_oY
X-Proofpoint-ORIG-GUID: giEohDLp3BjJHhky9czkQWtjDFSG5_oY
X-CU-OB: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_12,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=770 spamscore=0 bulkscore=10
 phishscore=0 impostorscore=10 adultscore=0 suspectscore=0
 lowpriorityscore=10 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220084
X-Mailman-Approved-At: Tue, 23 Aug 2022 16:58:46 +0200
Cc: abhishek.shah@columbia.edu, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

Ok, makes sense, thanks for taking the time to look at our report.

Best,

Gabe

On Sat, Aug 20, 2022 at 3:05 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 19 Aug 2022 19:00:00 +0200,
> Abhishek Shah wrote:
> >
> >
> > Hi all,
> >
> > We found a data race involving the card_requested[card] variable=C3=A1h=
ere, which
> > can cause=C3=A1snd_request_card to be called multiple times. We are not=
 sure if
> > this has security implications however, but we would still like to repo=
rt it.
> > Please let us know what=C3=A1you think.=C3=A1
>
> It's harmless.  The result would be another call of request_module(),
> which might be just redundant but it doesn't influence on the behavior
> or the safety.
>
>
> thanks,
>
> Takashi
>
> >
> > Thanks!
> >
> > ----------Report-----------
> > write to 0xffffffff88382191 of 1 bytes by task 6541 on cpu 0:
> > =C3=A1snd_seq_client_use_ptr+0x254/0x610 sound/core/seq/seq_clientmgr.c=
:146
> > =C3=A1snd_seq_info_clients_read+0xd8/0x480 sound/core/seq/seq_clientmgr=
.c:2475
> > =C3=A1snd_info_seq_show+0x81/0xa0 sound/core/info.c:361
> > =C3=A1seq_read_iter+0x2d2/0x8e0 fs/seq_file.c:230
> > =C3=A1seq_read+0x1c9/0x210 fs/seq_file.c:162
> > =C3=A1pde_read fs/proc/inode.c:311 [inline]
> > =C3=A1proc_reg_read+0x123/0x1b0 fs/proc/inode.c:323
> > =C3=A1vfs_read+0x1b5/0x6e0 fs/read_write.c:480
> > =C3=A1ksys_read+0xde/0x190 fs/read_write.c:620
> > =C3=A1__do_sys_read fs/read_write.c:630 [inline]
> > =C3=A1__se_sys_read fs/read_write.c:628 [inline]
> > =C3=A1__x64_sys_read+0x43/0x50 fs/read_write.c:628
> > =C3=A1do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > =C3=A1do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
> > =C3=A1entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > read to 0xffffffff88382191 of 1 bytes by task 6542 on cpu 1:
> > =C3=A1snd_seq_client_use_ptr+0x189/0x610 sound/core/seq/seq_clientmgr.c=
:145
> > =C3=A1snd_seq_info_clients_read+0xd8/0x480 sound/core/seq/seq_clientmgr=
.c:2475
> > =C3=A1snd_info_seq_show+0x81/0xa0 sound/core/info.c:361
> > =C3=A1seq_read_iter+0x2d2/0x8e0 fs/seq_file.c:230
> > =C3=A1seq_read+0x1c9/0x210 fs/seq_file.c:162
> > =C3=A1pde_read fs/proc/inode.c:311 [inline]
> > =C3=A1proc_reg_read+0x123/0x1b0 fs/proc/inode.c:323
> > =C3=A1vfs_read+0x1b5/0x6e0 fs/read_write.c:480
> > =C3=A1ksys_read+0xde/0x190 fs/read_write.c:620
> > =C3=A1__do_sys_read fs/read_write.c:630 [inline]
> > =C3=A1__se_sys_read fs/read_write.c:628 [inline]
> > =C3=A1__x64_sys_read+0x43/0x50 fs/read_write.c:628
> > =C3=A1do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > =C3=A1do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
> > =C3=A1entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > Reported by Kernel Concurrency Sanitizer on:
> > CPU: 1 PID: 6542 Comm: syz-executor2-n Not tainted 5.18.0-rc5+ #107
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04=
/01/
> > 2014
> >
> > Reproducing Inputs
> >
> > Input CPU 0:
> > r0 =3D openat$procfs(0xffffffffffffff9c, &(0x7f00000004c0)=3D'/proc/aso=
und/seq/
> > clients\x00', 0x0, 0x0)
> > read$ptp(r0, &(0x7f0000001280)=3D""/4096, 0x1000)
> >
> > Input CPU 1:
> > r0 =3D openat$procfs(0xffffff9c, &(0x7f0000000000)=3D'/proc/asound/seq/=
clients\
> > x00', 0x0, 0x0)
> > syz_fuse_handle_req(r0, &(0x7f0000000040)=3D
> > "b49dac4d60a4ef29274ad6ec771da74d4c8c0fd83d0aeb9dfe8d26d06f9ce49c698d1b=
2dbca3915be594ab841c00c1928a4c4363e8b5d17b93829abe5cc366527d477458cd9ea1659=
ccb0c07b05158926dc748aefe7fbac30da85ef1aff793e0b99ff36257ec864a364666b2151e=
04e8d9a709e4c300368d5ba364e588c6f32a1829b7dab3a920b39918005984975164f1dedcf=
d04503f3659ab13386ab13bb7f2f160848a41792cb49eb2ffeca5915ee146e2c348b8fd37ff=
56d515b39d85fbb034b8e5e08c96b6579a19efe90844e30a790ec223767b8f5a409433b87de=
c579dc420a62ab203228136577a9945a59afda7efbe7dde89be13a4fdf54ead3624b1a5c70e=
fe99d2e36cb5c1001427e116128ce2601e552e2f50642e1dba23f9526788a382acb79f92fd7=
33f10bdcf9a4035122730498ca3481a4d2e7ae2c6bddd8cb1f8899f0f5d36975b1f1aa989a1=
82029e3225d98a503e97073a728978795a6f27457df5fe5d19182d314ba3b15ad8a430e808b=
cda1bccfc1e6ea459aab7c062fb5d92b54098e73706e4d2b90b3985ce35736e715b04b7e590=
fa7349b639069928f5153a8d31e443a21546029d24943a69e44f65a4e253b538b8803366e45=
cdffa3c45c4c012981eb018dc04af8c082acaa2eff05cb91025d6424a2d9600ac2539deef60=
540c030f90c8adc939d3b6830
>  3babc5da851c88b15e238eb0515c1210398235eb76dba454f4e1f460d3cd13d85cc5a531=
968955064dae07b2c63d17d343fb80494fcce2f84775be037fd6d0e05834da6408fce3dc3c8=
d45bf33f500d83c4f5ce015544464daa6b4965987a6454eb6e29bf33d654ab0c6682cbbb552=
0afeb93c9c9b377886ef4b18f31c6c6e67fff8388e19c5ba73efda0e7874dc365c05da5ac4d=
360161a8a28aa41a3d410da55e464886bc2c69d2c441961f5eb7cd428e410d12c0a083f197a=
bc4a249a7cee1d6f495f4513f8ca194c43e967ddd342ecb3c3cecef199a1beace9e374ebe04=
e9dfff46fa4d6e3b8296a1a3f8daa431e1a45598100f53292630c7e27efbf18a0236e33fa08=
b66af22c8325e04f1c6a7e48844fdd6d506663d15cfdd7c63f60803c6e0db5cef6d111a6401=
bccc09ec05f56bace7eacfbf2f6954c4e9c00f6e4b8cf6622f7f23570fc4b730d8cd8f9b322=
eabadffa9631105943e621a018d3cf7fc4242d457c068e94342f819808a491f2c62ea07fba2=
a08b15ab208d64e1cde2020f0ae9f8f903dcb78bafd589832e4e8a02ac3a27749acee64fba7=
081c782d68df0a7314f95514e9022845062f8caf3052ffe55a5bc538789ec6eca37a26055ff=
6768cb5d5158a8be6321233efdb9ce135fccf3f20e696dbeec3776986e210d1c36881657b9e=
b3708c0437955f8b1ba617b94
>  40dee185741f554facdc7da8daa55015b19dc8f5e32499797e1b85941a801771717184ce=
09c569cacf82992b2f8c33ede8e02a8a3e1fbd4835c2d943f144498aa1edf50d1d2af669b14=
8d433b7a7e55b08a0fbf49572b4815ae96d35a8297b57b73c8333e7d7718169ac83129eecea=
08565172ee26e8cc29682fc2af3f8f1fa1fa411205b8376389065551c7cfeb87b6036f91f20=
566f6274df1365f0122bb139ee6c6298854126ce7d2f69233d1d7a8edcaf6b15d97baaaaeaf=
d1d4069b83bea98694dc9ef8fb6beae9dc5d1ede7458bd897b11fe93ef6f39858dc21041933=
1327fd5dac69c6ff352ea04e439ce97e7ae904db5a86a5ed4bec35cd4e16bc1e3d54c591a93=
da93645eb697065719a7c41bfc0a4b573961eb6f0a944aea68e65e28713d4ce77bcf5e1cc8c=
25375f075ac66c2b1116f9d89a7614c60cd5afbc86fdad7fac5a629ed5b808480dd2cd0448f=
85ef5c308fb4cb9a618bed06155cfd7e6c18f4241bc63a960056dbf837de0dbbf742a23256a=
f0acf855a722bf62630e8df2c57d92b3cb7aaa6cc26cbb20670fafee9af231f1d391f560f42=
57bd3a976ea0d22fc05c592adfe85c5f81ebf885eb93c23dd6ed3f84eb39766d28c1de7fd75=
250dcfc469cfad4ac3cecc8d148de571669ef7d1fe1f115ec7533fb8a81c87b54602a0726a9=
b47dd31b536fc51f4b7d292b8
>  3b191524c457dd618536e3b7ad20e222a1c9bf725ce5586463262d112f3336b9da8abb55=
fe4c756808a0b8617fd69d84f91d444a72c22116be94a52d1b2bb79cae60a4b9cf39d198191=
67d4bd689e752b1ecf5cd50040cf6e6eea9183dfc793c332ce666c66b179363b3fa865846d6=
774d050e5037776df34c7ab6672ae1b350dd849b540b8b285eaf6794f507e2c7c10acf7bf7a=
d9521e86a1b72a1418c90ab696f8e984ed6c7f0f1810fc9011e8f3f6cd4d1687ea682a42faf=
fa296a00f9cc7c53210db85c9559207aa664f3c2716f524ad5fc0ed97bd880c14ace7d629c4=
3f02e413c562046eeb2b58f0ead899286ea8b5826af76b3e3d02e71137cbebe552306d1dd10=
16e097a54928033ea63f0540b05a3bf331773694b2546e4679c05d488b356a2d37d275b4cce=
e590bb7ac7483ca0a72149cea3b39f687fded587e5e94d25c3b3e1b1b0d47b2bde830331905=
390837a3fefdda1feba5ffebb6cf9ec2ad3882e3094c39da450daac74592c20ae560c61cbcb=
1d487f8d54e76c808178b2cc0ab1d072820b291f3092c49b205981f45318135c8075d860e7e=
efbb640dd8e80498167db26b3ece09c8099eff0c3cf5cbfe6440472ed5d3ce8548b15004423=
868118b0e87655315856fc2102b804c1e28b6da7dcdba54ecae6b721477fca494bd3b72f464=
80ae87f334494c602819d6a3e
>  9cbd6c2f2b3a9d32c8eae8c1484b8dc5eea2c006ad95fa3d7e80d89e1aa6ae8a98fcb95e=
cd8a654d176cc7ada0c6424a898ff8a9859b2a29a51d36b879011a24ae2a4e0f69f02c95ac3=
da7246a45681d91bc0ebf019e3e2031fb3336b2ec10f7d94186fc0520999b775bac2eb542e5=
e3cfbfbcc5f5f56df6d9d0ca8e2308c6cbaefc861a0acf0622ec9fa7c4cac8590c6b4692219=
ed38b136ce5d659d00a8710b1ddf384edf5737101448015ea3f8c3fef0cb07602064035a457=
9a2b6bfc5edc1e81a8ab9522d6711f606183b3f59ec32c4df67da8289ce54ed9f97c7515746=
b859027c8ab1ddcbec9ab3c37c6dc0a97cb255961c69bc71936364ec49076400b4d918265cf=
aba0a9475d5dd1b8179653c3892aeb3f434a9ac2d9d3dbb81598a44cd90beb48a8949dd31f9=
07465dfd8bf651dc60ef0d535cc9d5493dda2c474a10b7726b63291b0d6107b47faf77ce62e=
ea112fbdfb95481c7f84d6cf9312faea8888284cfc04854f58fce61988e25a2dc9dbaf8f765=
9b21ace61be9d83c04789a202d72f2e411ab3db416dcf63abbc1c6d827aad75579eecb3a81a=
6e0d0669012db51435d53d3c0bf2426dbb431e2f4bc4938fa458692051f5047610687bc2077=
edee95274bd653ef1105086563f858c0db245454fe5fc83e6788c82310a02008ef76a3ffd35=
7d8452cf5a712f421f253cf81
>  232f1ca4d6f8364cb96b9bb2f23ab27a6ce3a2682b615ed762c5210bfc17229b83551af4=
82143374e21a115d77c98c8fb17487b2c9f25d8da17ff3e96b155354f611da1ff91bfd6d894=
36486a466642f96c5cbbbcedeee4d35d26ee982bd152bf309eb1c4f56bd77dc89861bb82eb5=
6405af798c7100768461f1b21d8e98d498ed5e2f74104d0309b00bf376cf32a82397d1adca7=
ca86950f5e63c60bd0189bac5dcb596ac0d111f9e6d17ed06a47bb92e49ea2ec4a295acd84b=
37524fbbd3c7516d4135d6d0625781fa85316098c4a8f94c4f10497ada2332b524e5e91c63b=
a4df47e1b33e0ebb9f748f1d0a338993cd4f155608e8238d3d574b8b166d46211909128848e=
96a28282b7cb652d103307c0028653b4fb40379b6d545fb1e2f5b9ea9d57a5b270db019e228=
b1edde431bd44e5728216781a5ba01163fd803c98e46a440e5617a781f55502c73aa1c417cf=
dfa7ef95fc83cfc0d9e7140df356cc0a3bf0824d4f3233ca963d367f9e6bd53b78edc3f5b0c=
53c9a836e02eb57e0c16417f9e42338aeada43fe34b4c525c29835d77e7695142361a500e09=
7f7d110f1912a534fa9441f1973b123d76817483f51deef7b2f7b3b180cf062b7acba7b7778=
8d7ae6be6cce00296097ae60ad84e588711a5a63b66aed3e01010381dfe53bda06ee770cd3f=
96b3fb7ec9ad700949e6ad320
>  62958e807b8b03204c3a77b5034143a6b342bb913dfc4a5db48c44235b56ee464e933b2b=
d7e46b49ab01166492d4d46a48b730532b13e231984c7afd18ae13663ab84c385e367021ad3=
dfa918860243454ac08e00e27ec0b193f67fa33cd43d9bd69b34ad29184924c98e61454afef=
c5cc69e32d0792c65aa0638b5d128fdee58bdaeae09969fc7493296c0f7689093e24609f44a=
1ea4a4cb7aa4e46082e89fbcae15862c5f1423ccb651a5b12f952797d0854ebfcf6dc494add=
5d140a5deee50f3c9729f2779aa0bb0339690770f090b3719a53b9e0a4521d3a9811bcd1702=
642f7c5d4142044826f97edf713bb6a695b5f34e705eefd386df6ab621fb8f4e39641926908=
c9a37df76bef9b40fb352c8b2266a079625c81f0b6823348e7dfe593fd6c155fc2b0c082b04=
a8098712b02a4bb9a60a4f68cbf60b58d61f32798c66edf64d387576630902a13b5a1f8f5f5=
1a79c708d7d2c68d2be1c68e5fd8757a3c3ccf951e65727722868688133ce0cc22a7d3db72f=
d0d3ae51d9c169055d754011b1de6a6be680c55bf92e6fcbc645941b2e89afa7b91ad61726c=
87e3c4e131608ce244fea2018925ba74dd8cac6e6f5c455978b7151eb6e6e7a797590d784cd=
9464450f89a671c29804a1eb7c96612ba025fd4d2564a0199a1c18c20964c2fecc0c463fcf0=
c1d3089b46ae523b6fb259cce
>  1a0171254f847945a862ceb3ae1fe7082958d06ce952f3f079df3490b448cda60acddbae=
d7ae50eb32eed1feab15b075e7fac69c4142dab32f9abd562c6a3ffcc6d3fc0595e202f3430=
080a8c85665a25889fa5f78f403f9ac93cfa160fd242d9cf123e43010891bfb21f7518588aa=
9f94393daf212c7a396cacfa27f29bdf8ce0c9269c3270466aae1df02832e605dd3aabfde47=
b93cfc812feb65bf1f0b326f48fa89f00059d0bcab950f229f128eea46d16a9d3feb5c04f5e=
707f835de686df16ceaae1ac98cb5a7abd0852cd80f8f2c093ca86b4fcdfcfb4648d244b5bc=
734ce2bff50880b4de5cad96aff1eca5e3f93dcecbde2a06b0371529d471908c05654e463c7=
87e56e24edcdc363a93b22fa7925a4f205e62ef6d7f7f64b7e9525b7e8c694f19738d5311fb=
e12f1b8123035323775ba87e1e77bb9eddb09e22f65a175f51bce14ec6bceeca1bfba4bd69d=
4e18d8442c8f60d2747ec7373e8e49b412b769dde6486eca1b98231ddac5164ace299b5bc3b=
6cf82c00ae55a1a47af14a72a5f05ce3c94ad6dfb2af8712262a0d2dce422946d84fe643530=
a0528eafabe77a14c9da86eca5d7556832b2dff7005f79f61ba802b6c855ea38a043d18d996=
c21897f7c820b1ea63cd5d823472adfd8b56df62d0a14f15c9e48b9ca7d4aceb012a16778d8=
8ebe48c501e9dd460d3a21a0a
>  4bcc4bc7129bda1912eff1a3d43fdd75cf7c2c50978d94fbf65b34fe73d003084fcf6133=
f2336ffa4a4b927fed2ae7bcb010360805fa497af8cb3dfd2ea25419f3857899bdab0bdb61f=
3ea1de0f7d6aa6e79f5493fab9751eb0d9c5fe65956072125c47d94740f2a3ace54719f09eb=
f3e27d895d51935332265571596731ce3144330ea48d8995038d756986b111899c8630a2492=
0261a1f9907fdabd970f7dc69058a8efc4381b414752b12f3974ded28a149760c7fef4ddf90=
6b8210825d1c98dcdee80994996f6d93fe70d93f1736e362c311ea1fa5d3bce28fe7111c2a9=
d0baabf6bb77cb9054c863f2d40b990f41a0766364b31f4cb68bafc05a757abe072d0b38909=
1acff20f3ea906d01b9ca4fb4b251b84be30e93cb1017f8e1b1147120f6788548c759cf42c3=
99c6b643deeb66a98eee89ade40807724a20e1a3423641b5f03040141914d3d81f9717a8514=
0ffc052c781a59a18a52e08f00da35a5754ca4fbfa77c0c1265d9e28644ba89d4499a31b60e=
350eb61746207a0469b464303dbec4dbe13d297de3fc3b4e6bd37805ea69bf79e847633a8f6=
8d8a053401f82fafc0c1dbc5f7d03729f306f0d048994b53504aeb0e9dafb93394e6d425d22=
ff198579d546c63c0c77407c43bf9fbfbfd62ca8ac316ca4d19e4631cbbd9cdf21ecfbb3eea=
cdfa75605d803184c11bf9ee7
>  30942962e688c5fad693a6e88d21d61dfb51d8e84ffd090a5f7c31ef8f77e1a3e7ee77f7=
1531e3d3e190bc8bbfd5e7b7792a0e361baee79c9db165033a83fda2f1972b75ad31e299ee6=
9af7bb1c50870be803b17f6adc284bd18d10444b9af2a44be791515f2f229d549b8b85d0e05=
ac418c852336b917cf6b5cfde4f0521a19d3b888f72b71c5a5b11f96853f76da5cd954ecfde=
9b37f4f44f3187034c57790be1e696390b9ed4db6d660900b1bdf9f76447037ae56a1ec6d78=
560afa27aed79ef6b592db1056d97104d5cf8f16e5dc9e8c45915486c042ad29ed2c8084fb9=
4ee9ebf18792b83220dc38936c3d2e09a1ef541fc7a440b6a09674a55860fd9467efe1580a6=
601720b36f128612b20837c6f4cc44a43deb771a001885bb17467d7ec350ddc648f3c13b579=
213b91d35c02481280efdee61cae175923fe9e5f218d61b146b71d9d7d60dbf740ee3f53fe4=
6e7952cbca6595e56dfa02aecd623b6be5719f87de725d92df32838f1b61b4e7bae65b68361=
9ed8286e70382f801c067548d6f83c701c92fb84d0e0256114882af2c8fe2b67e456f7c7763=
7560a610693b6302d0f5e135c96036966aa6868b77d10e2272887491fce4ce8ec1e0fadc326=
707fa1a404384baec7b1ba0524ee1ee873662c1a530ea396fc5cf5fa3c8b117829cb144577b=
dce0cca193a180b0b2ba69ca8
>  fec31e70f7f6d5c2f5cbed9bd5a5998ed896fb4d36432b9ba8a6508fac5529cba750da9e=
2b651127c171fa7774d4c75b5b62fafc114c5775275a8ba20cbe7441a1709c2b0444d7f1721=
c368f35278c0b294b3cf8cb7fcad332f0f1bd2fdccb4c7e402c7efbfe9260b95ce72dc60889=
7dc394490607c8914d29fd0a37036cdbe69df74e78cad0f11221306fd15acd622dd709a19fd=
cf134362c358efc9398162c38b32ae9e66d12d50489643c43a19da922d14a90823d92bf3253=
a6916dee9768af98ec865f2d2413aeb1455a0d0264a1348757aae7746ad86ebdfe6971dbeec=
2b30c36802e007da501bf27c68c5a7103d9e437ae6ab58f64b0ed67e258a7c7f9a9b07d6bb1=
1e3e511d877085170d8c33e20a62f34c655cdfc2a788e69339ed9c08be0019130ec88b4a4b2=
13d089bc182f8595547353bb36e1fb2df57405c982070a4ceff26e4ea2a3d2faa45f1f6a965=
c83429ce4ce07c6b5db04a4031247babd3cd8cf39861f4702c92ee85251ebe2456e4429f8a3=
2efbac1e57c6baa36554dc807720077a8ca19a9db71710eefa1e9c202878b8b7f4a124db303=
ccd3a2dfe31cb5f0be4df44b5835cb95b089f5495ce35651a84ac26552c343dc63832a36c96=
6c92ba8e661ddbdab08775d50c40790e597bdc5b452565d0465cd93d6bb681b2596252fd255=
e4a208eed904dfbab2e6fe232
>  9c97cb3d15ecb63d3aff17e226f2e40c88ea6322bc6bbba4f6d750ed7f50908c3da02b48=
8a4fc86f0270227efb45b6a5382c1994d49fdd2544c0d03b88e410df64cc8dabf83916f3a40=
257c02ee9d4b67f8dd3297a9695c3ef0d06a28ad66e7619c0bf0fd2542483bd6ec8e9fa829e=
7a521c522a372364b4c20e5cab35442ce1ac237c3fd9d177c229bdb4ee9667430826e059c59=
b12bbb5cf03f7291b0afc303844dcf1df174357d7e2f833043595f2d8bcf6271bd2e844238f=
460ae082f59aebb3d18c87d482688c58c5541c79d10d44ca6dc221faeab71a36c0ca8fa5eb0=
cf337077ae07bab63f7aca2caaa588340f8796a564788d7436276039e83f25c6350121078c1=
0d896eb6d9cf6e7ea99290c10378e88d5e7309f17518e28454078d04bcb38f15d1a624cbc5c=
0d76878df58f220726c8365641e1fd2a66c9233bb3143af62c72bb06fc3cc627fbc66c9b778=
e254c4680c143b936c69a977fdbd3d5fad2ad6d974796d03e96989863d25de45313bb49421b=
acb3cd52e379c182b28bdbf18622026619be32e059d267bb1342e82dd0004f48e838ba2a379=
cd1e2bfc978b8aab80b79630a139c4dd89302547dc3296838f95a211f7a6f74d9e9f977832e=
7a6c4ccdce6e79c4735d700c81d6bb4c461d3288f41037abade34b7998ace0af5e7f9697e30=
42b171cdac15a7102d1b146db
>  3b9057e22c274e6a6c156da70fbf9a07e0b7b22b90400aca401c05f5168483f66d5fc1db=
6e467463e652ca41ead157d29ce14c19c493234287578e0e6c21b6aca9f59d6591c09c81649=
d5c1e4bbb43745e83cd9c23d5b7b89282efba61e3e790dbce7aaae0011c81dae1c48fc4400b=
d81da44b2417682744bd06ae1b9c63a004d9345202e63eb4a4708e6ddb20be55c843ee3fa19=
ddacf7ad32d1ded060d9d8bd46bff386e0a3fe41260a8c90a8eb0089083e1b72278e0a7398b=
6e2e27c256ea426174d6a1fbe4067685f9eab61ace1a655d3ca35cf566fd148112e11ca4f39=
d0fbe041aba99a93e11c44e4ff07e830a1acfa07132d287fbcdb2eec82e4fb4fad847c29f60=
1c578e6c7109340555fe16f82c058d60aa57d19baf6eccd59b8ffd789de6376dc9356b78494=
c5ea3d1c29bbeeba8e76433d3caa4adf0db15377834f5bb90f88b680030eb82b63fdd9f922d=
5bb0b054a50c8ac82c0925902dd351e8d9d61141d34b36f0a1d2a7b6ef6205ee1ceba611964=
e9e1268c57bed9cd5779961f38c7bc42fb9b66c024727ebe72ed9f6374eb44fa29ac11bf71c=
626a43c67b917a4481829a053644f769d0024104c9fd8f72fc7534323aab7efb20572fdbf68=
851c79aeee8137726145e4328fa70c38189f8441438947d6a49e3dd3dc9d5185d810aef71af=
d8dfbf96339ebd0e2a159f75d
>  8c34c9bf37ca5cdd791371e4e835962b7d92b5d0924ccb071b841e7f96d0552abcdb3fc6=
92f216fc687f72fbd360f534e2407d01f30ba9427f2fa5007dccb470c60fce127a577f91f07=
aaeaeff524b3fcdf9311171f443c5ad08b74b60ecbd8bfbb0fa842c18a5c8487f0247acdbeb=
393dc7cf376f6de99b13550c8db32a08c02a182dd15760da6c8bd3a7259724edec715570bb1=
8465330666bff3a7147bae0d500fe771410efb11b348a194d7ce949ce074ec24fe5f7716671=
eadb824ff5e1668563a5398b833b1cab4e9d2df97783a52fd91b60d1c700ec0616208f99ad3=
76de03162dd07dd42ffaa7c9ff4af7d48cde82c9dd040bd724039c929219079d23a7ca412aa=
b0ddc833aac5a9afe819fae46cd8c8006dc4e96e11fe826df073b1ad9520b0442af3bde997b=
97d23bcf7a284dc89703e0b41b597ca1c64a23944cf6ab196ecd33b1cd764396eded169bcf6=
2c7faa61f386ac64910852ef409c4c4242eb11a0ce5d13205891f3f6e8f568d781fd86636af=
3393918adcee3a73fac340f486d3c511a64c6587d0e0c553d087c3706bb8498dc059056b8ff=
d0d185df6c52b482bd55532550e1c9d37279ccf0ba698b90f185dc4c43aee53dacff0887fe8=
42ecffb450088407443b709691fb10a0e9b38c2af46a60e9a02db9d8efcb3e89d0a19ba31ed=
3975eaa95d8fc6aed274f3a0e
>  bccc99d3c5fb1be2d5a2f5814688db811d8af8fc273a8e47620e23934c1ea642cf776fa2=
76ad857cb023988ef39b237b00c72b85d86fed11fbdeaf31ced509c265822b560e7f0793eb5=
b53c5c7be3d855d146e2997f9974677dfa7a49f3c685bf24e8dcae56b3352c1038d8c7392af=
62ed22c5054157812ed4b14e6c7b9e4f8cba3fd99543ea467019ad74e2025b2b1c4195581ef=
91a88b999254ac748e748c4a50480a6cd3f5fd7d8bc919bdce7bf51925dc187df60af567ef2=
32cb59d5583d604a19928c2699905446f2758fc7b640fbd0a2b9494b2b13cea88da31c5b643=
663f592e9b9ba580c16a2371dfdb223c7c803389b331e2412862c26cd9254e1db521f0851d9=
fe1d9d3cec7718fa785e227ffeda95e47944bd76ad718a1e27fdc7a51bea6f128f593cff860=
e82a9b474e0956830a35340616f4e8fbb10c94698b4310ee49b9398d0501af47982a7add81f=
ef360000860926d09236532751a54107636120454e9b952ad891e645c74606a9869e5b6a4e2=
0178decbf842d3aba603be3f4ff149b23776954b4b9898755f05b91fcee1574dc66de42547c=
ee0b4f23c320224a737776bc4f04bcb996bef301b692d8b64d1d11d54dc5ef5760fda3e1657=
1cac787d1f0e6de4a88b7f6ef8886734a451c4c971545d9ffe39d80eeaf9f1c77ab04364ad3=
281a4d41a250e410e138fc759
>  cdf4e408a38d26a72bee16e1ddb1055c391a09fae22209e891d93be9c0cb1a8515e5ff69=
b55c5d9bc83bf92316d3addc29ed0d3cc1f8c6635f0726014fc7cf5236e7757cac9d391821f=
239267010b89d3918df46e1b483e5afa999ae7345850e17cf93d2da84d84e1a0d2e2bb95eb8=
90ac6fca1ebfb7387b799b02c275f915b5e4780dde3f738fc2432636d89d620f541d218d39d=
c7b1854e77c85d3661030e79d7838935724804e5885e901856debc53fd947b6f5239961943a=
d48d581d88e4ce26c0fbd342fac6159d2264ef4051fa29cb850649650537bcbf3ad06cf8736=
cf09df521eba9098f532953e1541b223db5f37de855f8673c59fdb1acce1b2cfc9fe50d38dc=
13f9809ea382cd4863c7c1c691eae1863f563054fa6a0bfb039d1dda3f250f52d155269e3f2=
ecfbfc57cb3add84f986ef9cb84f4c4b75d32d3edd960ceafbe69ac71a0a524bd79777f20fd=
fdd29d063e06c0bae7fd247592f05432406afb207f4476e0bed4e7b76395361a1bb7a16db6a=
95c59ddc1930053b93c51eee3f405f62a9e412d5c1aef4cc7a7ccb70d6d91ae27d477fcee7d=
84e1e3e519995127a43eb576d9518bd6112686fe7a90c7053d94f67c2878d3537af078ddfbd=
da06ba4c01888dbe6be9ef4f38e2f8d49a7d023996c516f1289fd9cfd4936089f0bcd0de515=
6d580b68554e8e9c3874a6b2d
>  56bc736f49217c88859aa63ea1384f3b9dbdc8b30262d0efffddec03fc4241740d23917e=
f92fc7de3ae3665ff3c9397bf4fcde524cc403f28806317a0059ae93d82e3fb5cc49596c785=
f46427317d2f3c9d285d239383dfbea914ad84213e1e0121533dc696bee622d0f93ed8eef2e=
1eb408364adfca90eef0236a85c8d5c4a55dd42793d18b9eaceb8727e1a5bf01b1156ca0445=
2485c6e4a9d40185664eec10c5fecc9dfd48536d5aa70c29eeb43c7a1a2ed73ff66a2604ed9=
59a811e2268980958b2ab1682fb2a5966ab85163a34a9efc27d349625970f1",
> > 0x2000, &(0x7f00000048c0)=3D{0x0, &(0x7f00000020c0)=3D{0x18}, 0x0, 0x0,=
 0x0, 0x0,
> > 0x0, &(0x7f0000002280)=3D{0x18, 0x0, 0x0, {0x9}}, 0x0, 0x0, 0x0, 0x0, 0=
x0, 0x0,
> > 0x0, 0x0})
> >
> >
