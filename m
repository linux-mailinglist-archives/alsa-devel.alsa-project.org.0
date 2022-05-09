Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6CE51FC6A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 14:15:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9F4E18D7;
	Mon,  9 May 2022 14:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9F4E18D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652098518;
	bh=b7ac863q5W4Aet8nXSy0whj2IEvZYaq8KE8G5R9eeiA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aLNefMPCNfepFQ9D3CnOhIIDHHMZHgpKxIfqs//0cvxGyOfa3LZSQfjU356em+No6
	 ziGvjTTZpZnBP60vNLBQOugGsg/TlNdjntngel6McaLeaXT6bV1Cafhr2S8SINiwjB
	 MRr6062ebaLwx7RSIbfbMqhnrJR4v4FaUWjQ0w74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFC0F800D3;
	Mon,  9 May 2022 14:14:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6811AF8014C; Mon,  9 May 2022 14:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FE51F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 14:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE51F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.b="i5YipCeS"
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249BrDfb040214;
 Mon, 9 May 2022 12:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=mFwQ6X5ROpPbQQvS6IJn0oLRB0j4XJ42BtNeuwsniXc=;
 b=i5YipCeSSsRdAH8k+QNJ+j59oyMtbdoQS4+eIhG4/7dVDJBgMkqSIQzzMfDkwlsPIiq0
 muFO0ZW6morKq8wYUKzFrVEohkgbVGO/f54wJC2ZOIY6PDnW+KrVccdF08rOHI5vO442
 B0akLZPrnl5zBWvUkSWzwiF+x18GDAVcAv8oO5uegXuYELfZcRRq+H9IPH0bcmNONtHv
 Ra8N8zQvFKjB3OMEz+vYBc8NRLplA7veoHGLDzdjy2eAl7SF/yiaz3+itqXi7Yz4ukJS
 jB0qo45Pk6MALDO9fcoZpLnfBaLprHgyPYJRH+22qSeBga3dfk8cQ1HfCouE5vRl5+4D zg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fy2frget4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 12:14:09 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 249C3A31030155;
 Mon, 9 May 2022 12:14:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3fwgd8tgux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 12:14:07 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 249CE5I045678890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 May 2022 12:14:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C677A4053;
 Mon,  9 May 2022 12:14:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECA35A4051;
 Mon,  9 May 2022 12:14:04 +0000 (GMT)
Received: from sig-9-145-22-239.uk.ibm.com (unknown [9.145.22.239])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 May 2022 12:14:04 +0000 (GMT)
Message-ID: <11a1cdd869a3153a39ef9c07ca67817f9ea512fe.camel@linux.ibm.com>
Subject: Re: [RFC v2 31/39] sound: add HAS_IOPORT dependencies
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Takashi Iwai <tiwai@suse.de>, Arnd Bergmann <arnd@kernel.org>
Date: Mon, 09 May 2022 14:14:04 +0200
In-Reply-To: <s5h35hjm32n.wl-tiwai@suse.de>
References: <20220429135108.2781579-1-schnelle@linux.ibm.com>
 <20220429135108.2781579-57-schnelle@linux.ibm.com>
 <s5hczgnm6ia.wl-tiwai@suse.de>
 <CAK8P3a3_ppFRY7y4TL21kXfthcbFJmjMivfmH2r4Cqy_vAiesA@mail.gmail.com>
 <s5h35hjm32n.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jdarINjh9VWb43QWZnBSEKM0W944MEzf
X-Proofpoint-ORIG-GUID: jdarINjh9VWb43QWZnBSEKM0W944MEzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_03,2022-05-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=727 spamscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205090069
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>
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

On Mon, 2022-05-09 at 12:07 +0200, Takashi Iwai wrote:
> On Mon, 09 May 2022 11:20:33 +0200,
> Arnd Bergmann wrote:
> > On Mon, May 9, 2022 at 10:53 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > On Fri, 29 Apr 2022 15:50:54 +0200, Niklas Schnelle wrote:
> > > >  config SND_OPL3_LIB
> > > >       tristate
> > > > +     depends on HAS_IOPPORT
> > > >       select SND_TIMER
> > > >       select SND_HWDEP
> > > >       select SND_SEQ_DEVICE if SND_SEQUENCER != n
> > > 
> > > Both of those are the items to be reverse-selected, so cannot fulfill
> > > the dependency with depends-on.  That is, the items that select those
> > > should have the dependency on HAS_IOPORT instead.
> > > 
> > > That is, a change like below:
> > > 
> > > > --- a/sound/isa/Kconfig
> > > > +++ b/sound/isa/Kconfig
> > > > @@ -31,7 +31,7 @@ if SND_ISA
> > > > 
> > > >  config SND_ADLIB
> > > >       tristate "AdLib FM card"
> > > > -     select SND_OPL3_LIB
> > > > +     depends on SND_OPL3_LIB
> > > 
> > > ... won't work.  CONFIG_SND_OPL3_LIB is not enabled by itself but only
> > > to be selected.
> > 
> > Right, I missed that in my review. Not sure if this was a mistake in
> > my original patch or if it started in a later version.

I added this part recently I think even after your review so the fault
is entirely mine.

> > 
> > I think for the ISA drivers, I would still add 'depends on HAS_IOPORT'
> > to both CONFIG_SND_ISA and CONFIG_SND_OPL3_LIB if only to
> > make it easier to understand, even though CONFIG_ISA requires
> > HAS_IOPORT already, and CONFIG_SND_OPL3_LIB cannot be
> > selected by itself.
> 
> Yes, that makes sense.

Good, incorporating this now and it looks like this works.

> 
> > For the PCI drivers, I think we need to add the same dependency
> > on anything that either selects SND_OPL3_LIB or calls inb()/outb()
> > directly.
> 
> Agreed.

Same as above and thanks for spotting my mistake.


