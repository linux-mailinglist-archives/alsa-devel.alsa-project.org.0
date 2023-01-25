Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 037AA67C57B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 09:05:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CCC5E80;
	Thu, 26 Jan 2023 09:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CCC5E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674720355;
	bh=ZbwHNBieKde9SPuDQsvRU69AZcW15GKg2OLhdvs2tnQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IPeCN9A5a4X4UT6CyNAMSf/yz3icCulKoaVVyn36n+oSi2DC3jS/CQxFqjRvT2JYk
	 6ZBLCw8c4Cs6yp7lEehG4Br2dpFi9ufYkebG8lBV6H7x4/Y2Mkb8OReAfHrox29QbT
	 7pwUGJk5rJjojvYHWNe1j0YzixHrr2IU7DMJ75Xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFEC6F8061F;
	Thu, 26 Jan 2023 08:55:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D94FDF80424; Wed, 25 Jan 2023 19:40:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBCBBF802E8
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 19:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBCBBF802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=uqNynxzu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j8xmcwaWWp8ClSuIcWbfPO9W4DI7+K1SIXYR1hupOAY=; b=uqNynxzucz1vO4Sybud/wnfqlG
 XxsLNOwKfxMMQq2z+2mEwSQepA2Cgl288rz8ppyGnCDD245OrpnK+lLHo83C85yAJqJOOkyy9NCp4
 qmW1PdDBkKx7H5H7CuTrTaW668Ax6XD7hJfO7woN7MoWAjzhSqQRaCuht1RFhZ03cdOhzx8vskmyo
 utYjRqoPln+RK+MIFkiqDBv2fEqneNERI4c9/pWDfp7yn00dEjgBzAOu+9ajSFVQvgY4Ml53E7t5d
 4KvoHjjGbdeWlMlk7Lgwsa8VGdyruWiJYIAak7bpfijYPXdYqIwuOD9Kmo+xWyNX8MhOoxpc82QLY
 /xONblxA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pKkeP-0066hH-0o; Wed, 25 Jan 2023 18:37:37 +0000
Date: Wed, 25 Jan 2023 18:37:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 1/6] mm: introduce vma->vm_flags modifier functions
Message-ID: <Y9F28J9njAtwifuL@casper.infradead.org>
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-2-surenb@google.com>
 <Y9Dx0cPXF2yoLwww@hirez.programming.kicks-ass.net>
 <CAJuCfpEcVCZaCGzc-Wim25eaV5e6YG1YJAAdKwZ6JHViB0z8aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpEcVCZaCGzc-Wim25eaV5e6YG1YJAAdKwZ6JHViB0z8aw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 26 Jan 2023 08:55:02 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, heiko@sntech.de,
 leewalsh@google.com, dri-devel@lists.freedesktop.org, jglisse@google.com,
 arjunroy@google.com, m.szyprowski@samsung.com, linux-arch@vger.kernel.org,
 qianweili@huawei.com, linux-samsung-soc@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, chenhuacai@kernel.org, kasan-dev@googlegroups.com,
 linux-acpi@vger.kernel.org, rientjes@google.com,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org, robdclark@gmail.com,
 minchan@google.com, robert.jarzmik@free.fr, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, npiggin@gmail.com, alex.williamson@redhat.com,
 viro@zeniv.linux.org.uk, luto@kernel.org, gthelen@google.com,
 tglx@linutronix.de, ldufour@linux.ibm.com, linux-sgx@vger.kernel.org,
 martin.petersen@oracle.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-media@vger.kernel.org,
 freedreno@lists.freedesktop.org, joelaf@google.com, linux-aio@kvack.org,
 linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, david@redhat.com,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 edumazet@google.com, target-devel@vger.kernel.org, punit.agrawal@bytedance.com,
 linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com,
 andrii@kernel.org, patrik.r.jakobsson@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-graphics-maintainer@vmware.com, kernel-team@android.com,
 jayalk@intworks.biz, soheil@google.com, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org, shakeelb@google.com,
 haojian.zhuang@gmail.com, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net,
 muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com,
 tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com,
 jasowang@redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com,
 linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org,
 dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, gurua@google.com, dgilbert@interlog.com,
 xiang@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com,
 quic_abhinavk@quicinc.com, bp@alien8.de, mchehab@kernel.org,
 linux-ext4@vger.kernel.org, tomba@kernel.org, hughlynch@google.com,
 sre@kernel.org, tfiga@chromium.org, linux-xfs@vger.kernel.org,
 zhangfei.gao@linaro.org, wangzhou1@hisilicon.com, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org, davem@davemloft.net,
 mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com,
 Peter Zijlstra <peterz@infradead.org>, bigeasy@linutronix.de,
 alexandre.torgue@foss.st.com, dhowells@redhat.com, linux-mm@kvack.org,
 ray.huang@amd.com, adilger.kernel@dilger.ca, kuba@kernel.org,
 sparclinux@vger.kernel.org, airlied@gmail.com, anton.ivanov@cambridgegreys.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at,
 x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, paulmck@kernel.org,
 jannh@google.com, chao@kernel.org, maarten.lankhorst@linux.intel.com,
 liam.howlett@oracle.com, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz,
 dimitri.sivanich@hpe.com, posk@google.com, lstoakes@gmail.com,
 peterjung1337@gmail.com, yoshfuji@linux-ipv6.org,
 linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev,
 kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org,
 johannes@sipsolutions.net, mgorman@techsingularity.net,
 linux-accelerators@lists.ozlabs.org, l.stach@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 25, 2023 at 08:49:50AM -0800, Suren Baghdasaryan wrote:
> On Wed, Jan 25, 2023 at 1:10 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > +     /*
> > > +      * Flags, see mm.h.
> > > +      * WARNING! Do not modify directly.
> > > +      * Use {init|reset|set|clear|mod}_vm_flags() functions instead.
> > > +      */
> > > +     unsigned long vm_flags;
> >
> > We have __private and ACCESS_PRIVATE() to help with enforcing this.
> 
> Thanks for pointing this out, Peter! I guess for that I'll need to
> convert all read accesses and provide get_vm_flags() too? That will
> cause some additional churt (a quick search shows 801 hits over 248
> files) but maybe it's worth it? I think Michal suggested that too in
> another patch. Should I do that while we are at it?

Here's a trick I saw somewhere in the VFS:

	union {
		const vm_flags_t vm_flags;
		vm_flags_t __private __vm_flags;
	};

Now it can be read by anybody but written only by those using
ACCESS_PRIVATE.
